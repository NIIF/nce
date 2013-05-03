## NIIF Common Environment
NIIF Common Environment is a Modules based shell environment tree.

A NIIF általános környezet egy Modules alapú shell környezet fa.

### Használat
A module környezetet a `$HOME/.bashrc` fájlban lehet aktiválni. Helyezzük el a következő sorokat az előbb fájl végére:

    module use /opt/nce/modulefiles
    module load nce/global
    module load niif/<SITE>

ahol a `<SITE>` értéke a következő gépspecifikus érték lehet: `budapest, debrecen, pecs, szeged`. Például a budapesti gépen a `module load niif/budapest`-nek kell szerepelni.

Elérhető modulok listája:

    module avail

Betöltött modulok listája:

    module list

A modulok a következő elv szerint vannak rendezve: `[csoport/]program[/verzió]`. A csoport és a verzió opcionális. Például a NetCDF könyvtár GCC 4.7.2-es fordítóval készített verziója a `netcdf/4.2.1.1-gcc-4.7.2` modulban található. Az egymást kizáró modulok automatikusan kitöltődnek, a modulok csak betölteni kell, például a NetCDF Intel fordítóval készített változatára a `module load netcdf/4.2.1.1-intel` pranccsal lehet váltani.

Részletes információ a modul tartalmáról:

    module show <MODULE>

Általában minden modulnak megfelel egy program könyvtár is, ahol a tényleges alkamazás találhat, a module csak környezeti változókat manipulál.

Vannak meta modulok is, amik több, egy csoportba tartozó modult töltenek be. Például a GNU alapú környezet így tölthető be:

    module load nce/niif/gnu

Az Intel alapú környezetre így válthatunk át:

    module load nce/niif/intel

## NIIF Common Environment

### Install
Install NCE into a shared directory and link to `/opt/nce`

    ln -s <INSTALL DIRECTORY>/nce /opt/nce

### Usage
Hook modules in you `$HOME/.bashrc`:

    module use /opt/nce/modulefiles
    module load nce/global
    module load niif/<SITE>

Where `niif/<SITE>` is the site specific initialization, currently `budapest, debrecen, pecs, szeged`.

### PRACE PCPE compilance

Tool      | Description  | Module Name | Level    | Priority | Comments
--- | --- | ---
bash      | BASH Shell   | NA          | required | normal   | default shell
tcsh      | TC Shell     | NA          | required | normal   | not recommended
OpenSSH   | Secure Shell | NA          | required | normal   |
Emacs     | Emacs text editor | NA     | required | normal   |
nedit     | Text editor  | nedit       | required | normal   |
C         | C compiler   | c           | required | normal   | nce/niif/intel
C++       | C++ compiler | c++         | required | normal   | nce/niif/intel
Fortran   | Fortran compiler | fortran | required | normal   | nce/niif/intel
Java      | Java compiler | java       | required | normal   | jre
Perl      | PERL         | NA          | required | normal   |
Python    | Python       | NA          | required | normal   |
TCL       | TCL          | NA          | required | normal   | 
TK        | TCL GUI toolkit | NA       | required | normal   | 
gmake     | GNU Make     | NA          | required | normal   |
MPI       | MPI          | mpi         | required | normal   | openmpi(intel)
BLACS     | BLACS        | blacs       | required | normal   |
BLAS      | BLAS         | blas        | required | normal   | acml
LAPACK    | LAPACK       | lapack      | required | normal   | acml
ScaLAPACK | ScaLAPACK    | scalapack   | required | normal   | scalapack(intel)
FFTW 2    | FFTW v2      | fftw2       | required | normal   | not provided
FFTW 3    | FFTW v3      | fftw3       | required | normal   | 
HDF5      | HDF          | hdf5        | required | normal   |
NetCDF    | NetCDF       | netcdf      | required | normal   |
