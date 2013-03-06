# 
# This file is part of the SIESTA package.
#
# Copyright (c) Fundacion General Universidad Autonoma de Madrid:
# E.Artacho, J.Gale, A.Garcia, J.Junquera, P.Ordejon, D.Sanchez-Portal
# and J.M.Soler, 1996- .
# 
# Use of this software constitutes agreement with the full conditions
# given in the SIESTA license, as signed by all legitimate users.
#
.SUFFIXES:
.SUFFIXES: .f .F .o .a .f90 .F90

SIESTA_ARCH=x86_64-unknown-linux-gnu--Gfortran

FPP=
FPP_OUTPUT= 
FC=mpif90
RANLIB=ranlib

SYS=nag

SP_KIND=4
DP_KIND=8
KINDS=$(SP_KIND) $(DP_KIND)

FFLAGS=-O2 -xSSE2 -openmp -I$(MKLROOT)/include 
FPPFLAGS= -DCDF -DWXML_INIT_FIX -DHAS_DLAMC3 -DALLOC_SAVE_BUG -DMPI -DFC_HAVE_FLUSH -DFC_HAVE_ABORT
LDFLAGS=

ARFLAGS_EXTRA=

FCFLAGS_fixed_f=
FCFLAGS_free_f90=
FPPFLAGS_fixed_F=
FPPFLAGS_free_F90=

# BLAS_LIBS=-lblas
# LAPACK_LIBS=$(AMD_ACML_HOME)/gfortran64/lib/libacml.a
# BLACS_LIBS=$(NCE_BLACS_LDFLAGS)
# SCALAPACK_LIBS=$(LIB_SCALAPACK_HOME)/lib/libscalapack.a

SCALAPACK_LIBS= $(MKLROOT)/lib/intel64/libmkl_scalapack_lp64.a \
-Wl,--start-group  $(MKLROOT)/lib/intel64/libmkl_intel_lp64.a \
$(MKLROOT)/lib/intel64/libmkl_intel_thread.a \
$(MKLROOT)/lib/intel64/libmkl_core.a \
$(MKLROOT)/lib/intel64/libmkl_blacs_openmpi_lp64.a -Wl,--end-group \
-liomp5 -lm -openmp 

# COMP_LIBS=dc_lapack.a     
NETCDF_INCFLAGS=-I$(LIB_NETCDF4_HOME)/include
NETCDF_LIBS=$(LIB_NETCDF4_HOME)/lib/libnetcdff.a \
            $(LIB_NETCDF4_HOME)/lib/libnetcdf.a \
            -lcurl

# NETCDF_LIBS=
# NETCDF_INTERFACE=

LIBS=$(SCALAPACK_LIBS) $(BLACS_LIBS) $(LAPACK_LIBS) $(BLAS_LIBS) $(NETCDF_LIBS)

#SIESTA needs an F90 interface to MPI
#This will give you SIESTA's own implementation
#If your compiler vendor offers an alternative, you may change
#to it here.
MPI_INTERFACE=libmpi_f90.a
# MPI_INCLUDE=$(MPI_ROOT)/include
MPI_INCLUDE=.

#Dependency rules are created by autoconf according to whether
#discrete preprocessing is necessary or not.
.F.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_fixed_F)  $< 
.F90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_free_F90) $< 
.f.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FCFLAGS_fixed_f)  $<
.f90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FCFLAGS_free_f90)  $<

