#!/bin/bash

_exit=0

_dead=$(gstat -i masterhost -d | grep Dead | awk '{print $3}')
if [ ${_dead} -gt 0 ] ; then
  gstat -i masterhost -d
  _exit=1
else
  echo "All hosts are running"
fi

exit ${_exit}
