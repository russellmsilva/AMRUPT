/* -*- c++ -*- */
/*
 * Copyright 2016
 * Travis F. Collins <travisfcollins@gmail.com>
 * Srikanth Pagadarai <srikanth.pagadarai@gmail.com>
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

#ifndef INCLUDED_DOA_AUTOCORRELATE_SMOOTHING_IMPL_H
#define INCLUDED_DOA_AUTOCORRELATE_SMOOTHING_IMPL_H

#include <doa/autocorrelate_smoothing.h>

#include <armadillo>

namespace gr {
  namespace doa {

    class autocorrelate_smoothing_impl : public autocorrelate_smoothing
    {
     private:
      const int d_num_inputs;
      const int d_snapshot_size;
      const int d_overlap_size;
      const int d_avg_method; // value assigned using the initialization list of the constructor
      const int d_subspace_smoothing;
      const int d_subarray_size;
      int num_outputs;
      int d_nonoverlap_size;
      arma::cx_fmat d_J;
      arma::cx_fmat d_input_matrix;
      arma::cx_fmat d_sub_input_matrix;
      arma::cx_fmat out_matrix_backwards;
      int start;

      void correlate_msg(pmt::pmt_t msg);

     public:
      autocorrelate_smoothing_impl(int inputs, int snapshot_size, int overlap_size, int avg_method, int subspace_smoothing, int subarray_size);
      ~autocorrelate_smoothing_impl();

      // Where all the action really happens
      void forecast (int noutput_items, gr_vector_int &ninput_items_required);

      int general_work(int noutput_items,
           gr_vector_int &ninput_items,
           gr_vector_const_void_star &input_items,
           gr_vector_void_star &output_items);
    };

  } // namespace doa
} // namespace gr

#endif /* INCLUDED_DOA_AUTOCORRELATE_SMOOTHING_IMPL_H */
