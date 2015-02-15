#!/bin/sh
# rebuild.sh - rebuild everything from scratch

if which cmake >/dev/null; then :;
else :
    echo "rebuild.sh: cmake not installed; see README.md" >&2
    exit 1
fi

# Start from scratch.
./clean.sh

# Re-fetch gtest.  I read in:
#   http://stackoverflow.com/questions/8507723/how-to-start-working-with-gtest-and-cmake
# that it is much easier to do use gtest from cmake by having the gtest source
# directory right in the project directory.
tar xzf gtest-1.7.0.tz

# Set up cmake to use clang and gtest.  A fair amount of googling went into this line.  :-)
cmake -DCMAKE_CXX_COMPILER="clang++" -DCMAKE_CXX_FLAGS="-std=c++11 -DGTEST_USE_OWN_TR1_TUPLE=1 -Werror -stdlib=libc++ -U__STRICT_ANSI__ -Igtest-1.7.0/include" .

# Do the initial build of the project.
make
