/* -*- c++ -*- */
/* 
 * Copyright 2016 
 * Srikanth Pagadarai <srikanth.pagadarai@gmail.com>
 * Travis F. Collins <travisfcollins@gmail.com>
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "rootMUSIC_linear_array_impl.h"

#define COPY_MEM false  // Do not copy matrices into separate memory
#define FIX_SIZE true   // Keep dimensions of matrices constant

namespace gr {
  namespace doa {

    rootMUSIC_linear_array::sptr
    rootMUSIC_linear_array::make(float norm_spacing, int num_targets, int num_ant_ele)
    {
      return gnuradio::get_initial_sptr
        (new rootMUSIC_linear_array_impl(norm_spacing, num_targets, num_ant_ele));
    }

    /*
     * The private constructor
     */
    rootMUSIC_linear_array_impl::rootMUSIC_linear_array_impl(float norm_spacing, int num_targets, int num_ant_ele)
      : gr::sync_block("rootMUSIC_linear_array",
              gr::io_signature::make(1, 1, sizeof(gr_complex)*num_ant_ele*num_ant_ele),
              gr::io_signature::make(1, num_targets, num_targets*sizeof(float))),
	      d_norm_spacing(norm_spacing),
	      d_num_targets(num_targets),
	      d_num_ant_ele(num_ant_ele)
    {
      // initialization of the Frobenius companion matrix
      d_comp_mat.zeros(2*d_num_ant_ele-2, 2*d_num_ant_ele-2);

      // set the first sub-diagonal to all-ones
      d_comp_mat.diag(-1).ones();

      start = 1;

      message_port_register_in(pmt::mp("recalc"));
      set_msg_handler(pmt::mp("recalc"), boost::bind(&rootMUSIC_linear_array_impl::calculate_msg, this, _1));
    }

    /*
     * Our virtual destructor.
     */
    rootMUSIC_linear_array_impl::~rootMUSIC_linear_array_impl()
    {
    }

    void rootMUSIC_linear_array_impl::calculate_msg(pmt::pmt_t msg) {
        if (pmt::is_pair(msg)) {
            pmt::pmt_t key = pmt::car(msg);
            pmt::pmt_t val = pmt::cdr(msg);
            if (pmt::eq(key, pmt::intern("recalc"))) {
                if (pmt::is_integer(val)) {
                    if (pmt::to_long(val) == 10) {
                        start = 0;
                        cout << "Stopping rootMusic!" << endl;
                    }
                    if (pmt::to_long(val) == 20) {
                        start = 1;
                        cout << "Starting rootMusic!" << endl;
                    }
                }
            } else {
                GR_LOG_WARN(d_logger, boost::format("Calculate message must have the key = 'recalc'; got '%1%'.") % pmt::write_string(key));
            }
        } else {
            GR_LOG_WARN(d_logger, "Calculate message must be a key:value pair where the key is 'recalc'.");
        }
    }

    void 
    rootMUSIC_linear_array_impl::get_roots_polynomial(cx_fmat& A, cx_fcolvec& roots) 
    {
      cx_fcolvec u(2*d_num_ant_ele-1);

      // determine the polynomial vector and normalize it
      for (int ii = -d_num_ant_ele+1; ii < 0; ii++) 
      {
	u(ii+d_num_ant_ele-1) = sum(A.diag(ii));
	u(d_num_ant_ele-1-ii) = conj(u(ii+d_num_ant_ele-1)); 
      }
      u(d_num_ant_ele-1) = sum(A.diag());
      u = (gr_complex(-1.0, 0.0)/u(2*d_num_ant_ele-2))*u;

      // assign u to the last-column of the Frobenius companion matrix
      d_comp_mat.col(2*d_num_ant_ele-3) = u.rows(0, 2*d_num_ant_ele-3);

      // determine its EVD to get roots of the polynomial vector
      eig_gen(roots, d_comp_mat);     
    }


    int
    rootMUSIC_linear_array_impl::work(int noutput_items,
        gr_vector_const_void_star &input_items,
        gr_vector_void_star &output_items)
    {
      const gr_complex *in = (const gr_complex *) input_items[0];
      float *out = (float *) output_items[0];

      // process each input vector (Rxx matrix)
      fcolvec eig_val;
      cx_fmat eig_vec;
      cx_fcolvec eigval_roots, eigval_roots_inside;
      fcolvec dist, dist_inside;
      uvec ind_inside_unit_circle; 
      uword min_dist_index; 
      for (int item = 0; item < noutput_items; item++)
      {
          if (start == 1) {
              // make input pointer into matrix pointer
              cx_fmat in_matrix(in+item*d_num_ant_ele*d_num_ant_ele, d_num_ant_ele, d_num_ant_ele);
              fvec out_vec(out+item*d_num_targets, d_num_targets, COPY_MEM, FIX_SIZE);

              // determine EVD of the auto-correlation matrix
              eig_sym(eig_val, eig_vec, in_matrix);

              // noise subspace and its square matrix
              cx_fmat U_N = eig_vec.cols(0, d_num_ant_ele-d_num_targets-1);
              cx_fmat U_N_sq = U_N*trans(U_N);

	      // determine the roots of the polynomial generated using U_N_sq
	      get_roots_polynomial(U_N_sq, eigval_roots);

	      // distance of the roots w.r.t the unit circle
 	      dist = 1.0-abs(eigval_roots);

	      // find roots which are inside the unit circle     
              ind_inside_unit_circle = find(dist > 0.0);
	      eigval_roots_inside = eigval_roots(ind_inside_unit_circle);
	      dist_inside = dist(ind_inside_unit_circle);	  
   
      	      // of the remaining, find the roots that are closest to the unit circle
	      fvec aoa_vec(d_num_targets);
	      for (int ii = 0; ii < d_num_targets; ii++) 
	      {
	        min_dist_index = index_min(dist_inside);

	        // locate the root and convert it to correct form
                aoa_vec(ii) = 180.0*acos(arg(eigval_roots_inside[min_dist_index])/(2*datum::pi*d_norm_spacing))/datum::pi;

	        // discard this minimum to find the next minimum
	        dist_inside(min_dist_index) = datum::inf;
	        eigval_roots_inside(min_dist_index) = gr_complex(datum::inf, 0.0);
	      }
	      // sort the AoA vector
	      // useful for display purposes
	      aoa_vec = sort(aoa_vec);
	      memcpy((char *)&(out[item*d_num_targets]), (const char *)aoa_vec.colptr(0), d_num_targets*sizeof(float));
          }
      }


      // Tell runtime system how many output items we produced.
      return noutput_items;
    }

  } /* namespace doa */
} /* namespace gr */

