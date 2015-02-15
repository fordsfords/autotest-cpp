#!/bin/sh
# tst.sh - do a make, and if successful, run unit tests

echo

# I like /usr/bin/time output format better than bash's built-in time.
/usr/bin/time make
STATUS=$?
if [ $STATUS -eq 0 ]; then :
    echo

    /usr/bin/time ./runUnitTests
    STATUS=$?
fi

echo "tst" `date`
exit $STATUS
