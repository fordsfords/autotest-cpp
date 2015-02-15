#!/bin/sh
# tst.sh

echo

/usr/bin/time make
STATUS=$?
if [ $STATUS -eq 0 ]; then :
    echo

    /usr/bin/time ./runUnitTests
    STATUS=$?
fi

echo "tst" `date`
exit $STATUS
