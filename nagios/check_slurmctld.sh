#!/bin/bash

_pid=$(ps ax | \
       grep slurmctld | \
       grep -v grep | \
       grep -v check | \
       awk '{print $1}')


if test -z "${_pid}" ; then
  echo "ERROR: slurmctld server is not running"
  exit 1
fi

echo "OK: slurmctld is running"
exit 0
