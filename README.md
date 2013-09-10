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
--- | --- | --- | --- | --- | ---
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

# SLURM ütemező

## Kötegelt használat
### Egyszálú programok (nem array job)
*Figyelem!* Egyszálú programok futtatására az un. *array job* mód való. Ha mégsem erre van szükségünk, akkor a következő job szkript alapot kell használnunk (`slurm.sh`):

    #!/bin/bash
    #SBATCH --job-name=serial
    #SBATCH -n 32
    #SBATCH -o slurm.out
    srun envtest.sh

ahol az `envtest.sh` szkript indítja el az egyszálú programot. A program kimenetét a `slurm.out` fájlban találjuk. Teszteléshez használjuk a következő egyszerű szkriptet:

    #!/bin/bash
    echo -n "$(hostname): "
    echo "PROCID=$SLURM_PROCID  NODEID=$SLURM_NODEID  NNODES=$SLURM_NNODES  LOCALID=$SLURM_LOCALID      NPROCS=$SLURM_NPROCS  NTASKS=$SLURM_NTASKS"

Az ütemező `SLURM` kezdetű shell változókat exportál a jobok számára. A `SLURM_PROCID` változóban található az adott szál azonosítószáma, ebben a példában (32 szál) 0-tól 31-ig. Az egyes szálak kimeneteit ennek segítségével lehet különböző fájlokba írni, pl.:

    echo -n "$(hostname): " > out.$SLURM_PROCID

[Bővebben](http://slurm.schedmd.com/quickstart.html)

### Egyszálú, tömbfeladatok, *array job*
[Tömbfeladatokra](http://slurm.schedmd.com/job_array.html) akkor van szükségünk, ha több egyszálú programot szeretnénk futtatni:

    #!/bin/bash
    #SBATCH --job-name=array
    #SBATCH --array=1-32
    srun envtest.sh

Az egyedi azonosítót ilyenkor a `SLURM_ARRAY_TASK_ID` változó tartalmazza. A kimeneti fájlok `slurm_<JOB_ID>_<TASK_ID>.out` nevűek lesznek.

### Párhuzamos futtatás
#### OpenMP
Az OpenMP (OMP) párhuzamosítás SMP gépeken működik, ezért maximum egy node-ot lehet lefoglani ilyen feladatok számára. Alapértelmezésben az OMP szálak száma a processzorok számával lesz egyenlő:

    #!/bin/bash
    #SBATCH --job-name=omp
    #SBATCH -N 1
    #SBATCH -o slurm.out
    ./a.out

Az [`a.out`](https://computing.llnl.gov/tutorials/openMP/samples/C/omp_hello.c) OMP program 24 szálon fog elindulni.

#### MPI
A Slurm az MPI könyvtárak nagy részét támogatja, ezért az MPI futtatókörnyezetet nem kell külön paraméterezni. MPI programok foglalásának alapegysége a node. A node-ok száma mellett meg kell adni az egy node-ra eső MPI processzek számát is:

    #!/bin/bash
    #SBATCH --job-name=mpi
    #SBATCH -N 2
    #SBATCH --ntasks-per-node=24
    #SBATCH -o slurm.out
    mpirun ./a.out

Az [`a.out`](https://computing.llnl.gov/tutorials/mpi/samples/C/mpi_hello.c) OpenMPI-vel fordított program 2 node-on, összesen 48 szálon fog elindulni.
