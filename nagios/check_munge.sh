#!/bin/bash
_pid=$(ps ax | \
       grep munge | \
       grep -v grep | \
       grep -v check | \
       awk '{print $1}')

if test -z "${_pid}" ; then
  echo "ERROR: munge server is not running"
  exit 1
fi

echo "OK: munge is running"
exit 0
