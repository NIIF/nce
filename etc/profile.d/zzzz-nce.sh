
if ! test -r "/etc/NCE_SYSTEM" ; then
  echo "Set /etc/NCE_SYSTEM"
else
	# clean
	module unuse /usr/share/modules/modulefiles
  module purge
  module use /opt/nce/modulefiles
  module load nce/global
  module load $(cat /etc/NCE_SYSTEM)
  export PS1="${NCE_HOSTID}[\h] \W (\$?)\\$ "
fi

if ! test -z "${NCE_SCHEDULER}" ; then
  module load ${NCE_SCHEDULER}
fi

if ! test -z "${NCE_DEFAULT_MPI}" ; then
  module load ${NCE_DEFAULT_MPI}
fi
