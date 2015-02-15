#!/bin/sh
# autotest.sh - for C/C++ programs built with "make" and tested with "tst.sh"

IWD=`/bin/pwd`  # remember initial working directory
# Find dir where tool is stored (useful for finding related files)
TOOLROOT=`basename $TOOL .sh`  # strip off ".sh" (if any)
TOOLDIR=`dirname $0`
# Make sure TOOLDIR is a full path name (not relative)
cd $TOOLDIR; TOOLDIR=`/bin/pwd`; cd $IWD

# Wait for a .c, .cpp, .h, .hpp file to change.  The first "-e" prevents
# inclusion of invisible files that emacs likes to create, like .#learn.cpp,
# and the second is to prevent inclusion of non-c files.
fswatch -l .2 -e '\/\.' -i '\.[ch]p*$' -e '.*' . |
  while true; do read ILINE; echo; echo "autotest:" $ILINE; if make; then ./tst.sh; fi; done
