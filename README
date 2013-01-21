## NIIF Common Environment

### Install
  - Install NCE into a common nfs directory and link to /opt
  ln -s .../nce /opt/nce

  - Set permission and ownership

  - Edit /usr/share/modules/init/.modulespath on login and in compute node images
  - Comment all lines

### Usage Example
  - Edit $HOME/.profile
  module purge
  module use /opt/nce/modulefiles
  module load nce/global
  module load niif/<SITE>
  source $NCE_ROOT/etc/functions.$NCE_SCHEDULER
  source $NCE_ROOT/etc/alias

  - The nce command shows the NCE environment

### Install packages
  - Compile and install packages into /opt/nce/packages/<PROGRAM>/<VERSION>

