# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/a/QtFromGit/test_SSE2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/a/QtFromGit/test_SSE2/build-test_SSE2

# Include any dependencies generated for this target.
include CMakeFiles/test_SSE2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test_SSE2.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test_SSE2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_SSE2.dir/flags.make

CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o: CMakeFiles/test_SSE2.dir/flags.make
CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o: test_SSE2_autogen/mocs_compilation.cpp
CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o: CMakeFiles/test_SSE2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/QtFromGit/test_SSE2/build-test_SSE2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o"
	/home/a/myb/buildroot/output/host/bin/i586-buildroot-linux-gnu-g++ --sysroot=/home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o -MF CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o -c /home/a/QtFromGit/test_SSE2/build-test_SSE2/test_SSE2_autogen/mocs_compilation.cpp

CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.i"
	/home/a/myb/buildroot/output/host/bin/i586-buildroot-linux-gnu-g++ --sysroot=/home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/a/QtFromGit/test_SSE2/build-test_SSE2/test_SSE2_autogen/mocs_compilation.cpp > CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.i

CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.s"
	/home/a/myb/buildroot/output/host/bin/i586-buildroot-linux-gnu-g++ --sysroot=/home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/a/QtFromGit/test_SSE2/build-test_SSE2/test_SSE2_autogen/mocs_compilation.cpp -o CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.s

CMakeFiles/test_SSE2.dir/main.cpp.o: CMakeFiles/test_SSE2.dir/flags.make
CMakeFiles/test_SSE2.dir/main.cpp.o: ../main.cpp
CMakeFiles/test_SSE2.dir/main.cpp.o: CMakeFiles/test_SSE2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/QtFromGit/test_SSE2/build-test_SSE2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/test_SSE2.dir/main.cpp.o"
	/home/a/myb/buildroot/output/host/bin/i586-buildroot-linux-gnu-g++ --sysroot=/home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/test_SSE2.dir/main.cpp.o -MF CMakeFiles/test_SSE2.dir/main.cpp.o.d -o CMakeFiles/test_SSE2.dir/main.cpp.o -c /home/a/QtFromGit/test_SSE2/main.cpp

CMakeFiles/test_SSE2.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_SSE2.dir/main.cpp.i"
	/home/a/myb/buildroot/output/host/bin/i586-buildroot-linux-gnu-g++ --sysroot=/home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/a/QtFromGit/test_SSE2/main.cpp > CMakeFiles/test_SSE2.dir/main.cpp.i

CMakeFiles/test_SSE2.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_SSE2.dir/main.cpp.s"
	/home/a/myb/buildroot/output/host/bin/i586-buildroot-linux-gnu-g++ --sysroot=/home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/a/QtFromGit/test_SSE2/main.cpp -o CMakeFiles/test_SSE2.dir/main.cpp.s

# Object files for target test_SSE2
test_SSE2_OBJECTS = \
"CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/test_SSE2.dir/main.cpp.o"

# External object files for target test_SSE2
test_SSE2_EXTERNAL_OBJECTS =

test_SSE2: CMakeFiles/test_SSE2.dir/test_SSE2_autogen/mocs_compilation.cpp.o
test_SSE2: CMakeFiles/test_SSE2.dir/main.cpp.o
test_SSE2: CMakeFiles/test_SSE2.dir/build.make
test_SSE2: /home/a/QtFromGit/build_artifacts_cross/lib/libQt6Core.a
test_SSE2: /home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/lib/libz.so
test_SSE2: /home/a/QtFromGit/build_artifacts_cross/lib/libQt6BundledPcre2.a
test_SSE2: /home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/lib/libglib-2.0.so
test_SSE2: /home/a/myb/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/lib/libgthread-2.0.so
test_SSE2: CMakeFiles/test_SSE2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/a/QtFromGit/test_SSE2/build-test_SSE2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test_SSE2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_SSE2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_SSE2.dir/build: test_SSE2
.PHONY : CMakeFiles/test_SSE2.dir/build

CMakeFiles/test_SSE2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_SSE2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_SSE2.dir/clean

CMakeFiles/test_SSE2.dir/depend:
	cd /home/a/QtFromGit/test_SSE2/build-test_SSE2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/a/QtFromGit/test_SSE2 /home/a/QtFromGit/test_SSE2 /home/a/QtFromGit/test_SSE2/build-test_SSE2 /home/a/QtFromGit/test_SSE2/build-test_SSE2 /home/a/QtFromGit/test_SSE2/build-test_SSE2/CMakeFiles/test_SSE2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_SSE2.dir/depend

