## NIIF Common Environment
NIIF Common Environment is a Modules based shell environment tree.

A NIIF általános környezet egy Modules alapú shell környezet fa.

### Install
Install NCE into a shared directory and link to `/opt/nce`

    ln -s <INSTALL DIRECTORY>/nce /opt/nce

### Usage
Hook modules in you `$HOME/.bashrc`:

    module use /opt/nce/modulefiles
    module load nce/global
    module load niif/<SITE>

Where `niif/<SITE>` is the site specific initialization, currently `budapest, debrecen, pecs, szeged`.

### Használat
A module környezetet a `$HOME/.bashrc` fájlban lehet aktiválni. Helyezzük el a következő sorokat az előbb fájl végére:

    module use /opt/nce/modulefiles
    module load nce/global
    module load niif/<SITE>

ahol a `<SITE>` értéke a következő gépspecifikus érték lehet: `budapest, debrecen, pecs, szeged`. Például a budapesti gépen a `module load niif/budapest`-nek kell szerepelni.

### Install packages
  - Compile and install packages into /opt/nce/packages/<PROGRAM>/<VERSION>

