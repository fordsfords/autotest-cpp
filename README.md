# autotest-cpp
Sample files for clang + gtest + cmake with on-write automated test

# Intro

This is my first attempt to create a C++ development environment.  I use a Mac, and I want to learn C++11, and so will be using clang.  Also, all the cool kids seem to love cmake, so I'll try that too.  Also, I want automated unit testing, and am trying googletest (gtest).  Finally, I want a rapid test cycle, and therefore created a simple autotest script which runs the gtest unit tests every time I write a source file from the editor.


# Files

The main files in this sample are:
* `learn.cpp` - the unit tests (in gtest form).
* `clean.sh` - script to remove all generated files.
* `rebuild.sh` - script to generate the cmake `CMakeLists.txt` file, re-configure, re-generate the Makefile, re-build gtest, and re-build `learn.cpp`.
* `tst.sh` - script to run the unit tests executable.
* `autotest.sh` - script to monitor for updated source files and re-run `make`.
* `gtest-1.7.0.tz` - compressed tar snapshot of gtest.


# Usage

After downloading, get started with:
```
./rebuild.sh
```

Then you can manually run the unit tests in `learn.cpp` with:
```
./tst.sh
```

You can manually do a "minor" rebuild with:
```
make
```

By minor, I mean after you've made changes which do not require re-generating the `Makefile`.  However, if you add/remove files, or otherwise need to change the cmake list file, you'll have to run `rebuild.sh`.

You can run the automated tester in one window with:
```
./autotest.sh
```
while you edit source files in another window.  Each time you save a source file, the autotest window should wake up, do a "make", and if successful, will do a `./tst.sh`.
