# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/gr-xcorr

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/gr-xcorr/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/test-xcorr.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/test-xcorr.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/test-xcorr.dir/flags.make

lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o: lib/CMakeFiles/test-xcorr.dir/flags.make
lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o: ../lib/test_xcorr.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/gr-xcorr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o"
	cd /home/pi/gr-xcorr/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-xcorr.dir/test_xcorr.cc.o -c /home/pi/gr-xcorr/lib/test_xcorr.cc

lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-xcorr.dir/test_xcorr.cc.i"
	cd /home/pi/gr-xcorr/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/gr-xcorr/lib/test_xcorr.cc > CMakeFiles/test-xcorr.dir/test_xcorr.cc.i

lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-xcorr.dir/test_xcorr.cc.s"
	cd /home/pi/gr-xcorr/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/gr-xcorr/lib/test_xcorr.cc -o CMakeFiles/test-xcorr.dir/test_xcorr.cc.s

lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o.requires:

.PHONY : lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o.requires

lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o.provides: lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-xcorr.dir/build.make lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o.provides

lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o.provides.build: lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o


lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o: lib/CMakeFiles/test-xcorr.dir/flags.make
lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o: ../lib/qa_xcorr.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/gr-xcorr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o"
	cd /home/pi/gr-xcorr/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o -c /home/pi/gr-xcorr/lib/qa_xcorr.cc

lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-xcorr.dir/qa_xcorr.cc.i"
	cd /home/pi/gr-xcorr/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/gr-xcorr/lib/qa_xcorr.cc > CMakeFiles/test-xcorr.dir/qa_xcorr.cc.i

lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-xcorr.dir/qa_xcorr.cc.s"
	cd /home/pi/gr-xcorr/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/gr-xcorr/lib/qa_xcorr.cc -o CMakeFiles/test-xcorr.dir/qa_xcorr.cc.s

lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o.requires:

.PHONY : lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o.requires

lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o.provides: lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-xcorr.dir/build.make lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o.provides

lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o.provides.build: lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o


# Object files for target test-xcorr
test__xcorr_OBJECTS = \
"CMakeFiles/test-xcorr.dir/test_xcorr.cc.o" \
"CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o"

# External object files for target test-xcorr
test__xcorr_EXTERNAL_OBJECTS =

lib/test-xcorr: lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o
lib/test-xcorr: lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o
lib/test-xcorr: lib/CMakeFiles/test-xcorr.dir/build.make
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libgnuradio-runtime.so
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libgnuradio-pmt.so
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libboost_system.so
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libcppunit.so
lib/test-xcorr: lib/libgnuradio-xcorr-1.0.0git.so.0.0.0
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libgnuradio-runtime.so
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libgnuradio-pmt.so
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libboost_system.so
lib/test-xcorr: /usr/lib/arm-linux-gnueabihf/libgnuradio-fft.so
lib/test-xcorr: lib/CMakeFiles/test-xcorr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/gr-xcorr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test-xcorr"
	cd /home/pi/gr-xcorr/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-xcorr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/test-xcorr.dir/build: lib/test-xcorr

.PHONY : lib/CMakeFiles/test-xcorr.dir/build

lib/CMakeFiles/test-xcorr.dir/requires: lib/CMakeFiles/test-xcorr.dir/test_xcorr.cc.o.requires
lib/CMakeFiles/test-xcorr.dir/requires: lib/CMakeFiles/test-xcorr.dir/qa_xcorr.cc.o.requires

.PHONY : lib/CMakeFiles/test-xcorr.dir/requires

lib/CMakeFiles/test-xcorr.dir/clean:
	cd /home/pi/gr-xcorr/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/test-xcorr.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/test-xcorr.dir/clean

lib/CMakeFiles/test-xcorr.dir/depend:
	cd /home/pi/gr-xcorr/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/gr-xcorr /home/pi/gr-xcorr/lib /home/pi/gr-xcorr/build /home/pi/gr-xcorr/build/lib /home/pi/gr-xcorr/build/lib/CMakeFiles/test-xcorr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/test-xcorr.dir/depend

