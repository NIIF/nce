#!/bin/bash

_exit=0

_dead=$(gstat -i scheduler -d | grep Dead | awk '{print $3}')
if [ ${_dead} -gt 0 ] ; then
  gstat -i scheduler -d
  _exit=1
else
  echo "All hosts are running"
fi

exit ${_exit}
