#!/bin/bash

_limit=${1:-30}

gstat -1 -i masterhost -a -l | \
grep ^cn | \
awk -v l=${_limit} -F, 'BEGIN{_exit=0} {
sub(/].*/,"",$3);
if ($3 > l ) {
  print $0;
  _exit=1;
}
} END{ exit _exit}'

exit $?
