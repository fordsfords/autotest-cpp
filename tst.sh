#!/bin/sh
# tst.sh

echo

time ./runUnitTests
echo "tst" `date`
exit $?
