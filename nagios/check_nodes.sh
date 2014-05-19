#!/bin/bash

_exit=0

_down=$(scontrol -o show nodes | grep DOWN | wc -l)
echo ""
echo "DOWN: ${_down}"
if [ ${_down} -gt 0 ] ; then
  _exit=1
  scontrol -o show nodes | grep DOWN
fi


_drain=$(scontrol -o show nodes | grep DRAIN | wc -l)
echo ""
echo "DRAIN: ${_drain}"
if [ ${_drain} -gt 0 ] ; then
  _exit=1
  scontrol -o show nodes | grep DRAIN
fi


_fail=$(scontrol -o show nodes | grep FAIL | wc -l)
echo ""
echo "FAIL: ${_fail}"
if [ ${_fail} -gt 0 ] ; then
  _exit=1
  scontrol -o show nodes | grep FAIL
fi

exit ${_exit}
