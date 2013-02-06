function status() {
  qstat -g c
}

function myqstat() {
  qstat
}

function allqstat() {
  qstat -u "*"
}


### balance
function mybalance() {
  sbank balance statement -u $*
}

function allbalance() {
  local _acc=${1}
  if test -z "${_acc}" ; then
    echo "Usage: allbalance <ACCOUNT>"
    return 1
  fi
  shift
  sbank balance statement -a "${_acc}" $*
}

### time check
function slurm/cpuhours() {
  local _n=0
  local _N=0
  local _c=0
  local _t=00:00:00
  local _opts=""
  local _args=$*
  local OPTIND
  while getopts n:N:t:h o "$@"; do
  case "$o" in
    N)
      _N=$OPTARG
      if ! test -z "$NCE_COMPUTE_SLOTS" ; then
        _c=${NCE_COMPUTE_SLOTS}
        _opts="${_opts} -c ${NCE_COMPUTE_SLOTS}"
      fi
      _opts="${_opts} -N ${_N}"
    ;;
    n)
      _n=$OPTARG
      _opts="${_opts} -n ${_n}"
     ;;
    t)
      _t=$OPTARG
      _t=$(sbank time calc -t ${_t})
      _opts="${_opts} -t ${_t}"
     ;;
    h|*)
      echo "Usage: estimate -n <TASKS> / -N <NODES> -t <TIME>"
      return 1
     ;;
  esac
  done

  sbank time estimate ${_opts}
}

function cpuhours() {
  echo "Estimated CPU hours: $(slurm/cpuhours $*)"
}

function estimate() {
  local _a=$1
  local _t=${2:-0}
  local _c=${3:-${NCE_SYSTEM##*/}}

  if test -z "${_a}" ; then
    echo "Usage: estimate -a <ACCOUNT> -t <CPUHOURS> [-c <CLUSTER>]"
    return 1
  fi

  sbank balance request -v --cluster ${_c} --account ${_a} --time ${_t}
}
