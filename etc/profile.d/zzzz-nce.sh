
if ! test -r "/etc/NCE_SYSTEM" ; then
  echo "Set /etc/NCE_SYSTEM"
else
  module use /opt/nce/modulefiles
  module load nce/global
  module load $(cat /etc/NCE_SYSTEM)
  export PS1="${NCE_HOSTID}[\h] \W (\$?)\$ "
fi
