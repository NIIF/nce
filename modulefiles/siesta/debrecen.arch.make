# This is a dummy arch.make
# You should not compile Siesta in this directory.
# See Obj/README
#

.SUFFIXES:
.SUFFIXES: .f .F .o .a .f90 .F90

SIESTA_ARCH=x86_64-linux-Intel_MPI

FC=mpif90
RANLIB=ranlib

SYS=nag

MKLPATH=/opt/intel/mkl/lib/intel64/

SP_KIND=4
DP_KIND=8
KINDS=$(SP_KIND) $(DP_KIND)

FFLAGS=-O2 -xSSE4.2 -g -I/opt/intel/mkl/include/ -I/opt/intel/mkl/include/intel64/lp64/
FPPFLAGS= -DCDF -DWXML_INIT_FIX -DHAS_DLAMC3 -DALLOC_SAVE_BUG -DFC_HAVE_FLUSH -DFC_HAVE_ABORT

COMP_LIBS=dc_lapack.a

#SIESTA needs an F90 interface to MPI
#This will give you SIESTA's own implementation
#If your compiler vendor offers an alternative, you may change
#to it here.
MPI_INTERFACE=libmpi_f90.a
MPI_INCLUDE=/opt/nce/packages/global/sgi/mpt/2.04/include

DEFS_MPI=-DMPI
DEFS= $(DEFS_MPI)

NETCDF_INCFLAGS=-I$(LIB_NETCDF4_HOME)/include
NETCDF_LIBS=-L$(LIB_NETCDF4_HOME)/lib/ -lnetcdf -lnetcdff

LIBS=-Wl,--start-group $(MKLPATH)/libmkl_blas95_lp64.a \
$(MKLPATH)/libmkl_lapack95_lp64.a $(MKLPATH)/libmkl_scalapack_lp64.a \
$(MKLPATH)/libmkl_blacs_sgimpt_lp64.a $(MKLPATH)/libmkl_intel_lp64.a \
$(MKLPATH)/libmkl_sequential.a $(MKLPATH)/libmkl_core.a -Wl,--end-group \
-lpthread -lm $(NETCDF_LIBS)

#Dependency rules are created by autoconf according to whether
#discrete preprocessing is necessary or not.
.F.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_fixed_F) $(DEFS) $<
.F90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_free_F90) $(DEFS) $<
.f.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FCFLAGS_fixed_f)  $<
.f90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FCFLAGS_free_f90)  $<

