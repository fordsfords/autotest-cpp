#!/bin/sh
# autotest.sh - for C/C++ programs built with "make" and tested with "tst.sh"

if which fswatch >/dev/null 2>&1; then :;
else :
    echo "autotest.sh: fswatch not installed; suggest using homebrew 'brew install fswatch'" 2>&1
    exit 1
fi
if [ ! -f Makefile ]; then :
    echo "autotest.sh: file Makefile not found; suggest running rebuild.sh" >&2
    exit 1
fi

# Wait for a .c, .cpp, .h, .hpp file to change.  The first "-e" prevents
# inclusion of invisible files that emacs likes to create, like .#learn.cpp,
# and the second is to prevent inclusion of non-c files.  Use /usr/bin/time
# because I prefer the single-line output.
fswatch -l .2 -e '\/\.' -i '\.[ch]p*$' -e '.*' . |
  while true; do read ILINE; echo; echo "autotest:" $ILINE; /usr/bin/time ./tst.sh; done
