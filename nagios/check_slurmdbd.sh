#!/bin/bash

_pid=$(ps ax | \
       grep slurmdbd | \
       grep -v grep | \
       grep -v check | \
       awk '{print $1}')

if test -z "${_pid}" ; then
  echo "ERROR: slurmdbd server is not running"
  exit 1
fi

echo "OK: slurmdbd is running"
exit 0
