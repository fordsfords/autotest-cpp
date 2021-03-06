# autotest-cpp
Sample project for clang + gtest + cmake + autotest


# Intro

This is my first attempt to create a C++ development environment.  I use a Mac, and I want to learn C++11, and so will be using clang.  Also, all the cool kids seem to love cmake, so I'll try that too.  Also, I want automated unit testing, and am trying googletest (gtest).  Finally, I want a rapid test cycle, and therefore created a simple autotest script which runs the gtest unit tests every time I write a source file from the editor.

All the research work for this sample project is embodied in the shell scripts.  I tried to make them as simple as possible for ease of leveraging my research.


## Dependencies

Requires `fswatch` which I got on my Mac using [homebrew](http://brew.sh/) ("`brew install fswatch`").

Requires `cmake` which I got on my Mac by [downloading](http://www.cmake.org/download/#latest) the `.dmg` file and doing the standard install.  When I did it, the syn links didn't install in /usr/bin, so I did:
```
sudo /Applications/cmake.app/Contents/bin/cmake-gui
```
to start the cmake app.  Then I pulled down "Tools" and selected "Install For Command Line Use", etc.

Requires gtest, a snapshot of which is included in this sample project.  Why?  Because I couldn't get it working externally with cmake, and [StackOverflow gave me the tip](http://stackoverflow.com/questions/8507723/how-to-start-working-with-gtest-and-cmake).


# Files

The main files in this sample are:
* `learn.cpp` - the unit tests (in gtest form).
* `clean.sh` - script to remove all generated files.
* `rebuild.sh` - script to run cmake to re-configure and re-generate the Makefile, re-build gtest, and re-build `learn.cpp`.
* `tst.sh` - script to run `make` followed by the unit tests executable.
* `autotest.sh` - script to monitor for updated source files and run `tst.sh`.
* `CMakeLists.txt` - master file for cmake.
* `gtest-1.7.0.tz` - compressed tar snapshot of gtest.


# Usage

After downloading, get started with:
```
./rebuild.sh
```
You'll need to re-run `rebuild.sh` when you make changes to your project that require re-generating the `Makefile`.  For exmaple, adding or removing a file, or making other changes to `CMakeLists.txt`.


Now you can run the automated tester in one window with:
```
./autotest.sh
```
while you edit source files in another window.  Each time you save a source file, the autotest window should wake up, do a "make", and if successful, will do a `./tst.sh`.


Subsequent to that, you can manually do a "minor" rebuild with:
```
make
```
By minor, I mean after you've made changes which do not require re-generating the `Makefile`.  HOWEVER, if you add/remove files, or otherwise need to change the cmake list file, you'll have to run `rebuild.sh` again.


You can manually run the unit tests with:
```
./runUnitTests
```


You can combine `make` and `./runUnitTests` with:
```
./tst.sh
```


# TODO

One significant problem is that if a number of files are changed, autotest will loop that many times.  It will be better if, when the first file change is detected, it waits a half second and reads the rest of the files from fswatch.  But I can't think of an easy way to do that without a C program doing non-blocking reads, which sounds too much like work.  Oh well, I'll get motivated to figure it out when I start being inconvenienced by the problem.  :-)
