#
# Set user limits
#

uid_limit=9000
sysops="root wheel sysop staff"

# 4GB
mem_limit=4096000
open_files=2048

_uid=$(id -u)
_group=$(id -gn)
_groups=$(id -Gn)

function limits/intersect() {
  local i
  local j
  for i in ${1} ; do
    for j in ${2} ; do 
      if test "$i" = "$j" ; then
        echo $i
      fi
    done
  done
}

# if has high uid (regular users)
if test ${_uid} -ge ${uid_limit} ; then
  # and not member of any privileged group
  _is=$(limits/intersect "${_groups}" "${sysops}")
  if test -z "${_is}" ; then
    # ulimit -l ${mem_limit}
    ulimit -m ${mem_limit}
    ulimit -v ${mem_limit}
    ulimit -n ${open_files}
    ulimit -u ${open_files}
    ulimit -c 0
  fi
fi
