--[[

NOTE1: Added new OMPI_MCA flag from https://github.com/open-mpi/ompi/issues/8350

NOTE2: Added the hwloc, libevent, and pmix line as Open MPI 5 seems to need these and
       even if Brew can provide them (like libevent), it doesn't seem to find them

NOTE3: I had to patch Open MPI 5.0.7 due to https://github.com/open-mpi/ompi/pull/13106/files

This was built using:

ml clang-gfortran/15

mkdir build-clang-gfortran-15 && cd build-clang-gfortran-15

../configure --disable-wrapper-rpath --disable-wrapper-runpath \
  CC=clang CXX=clang++ FC=gfortran-15 \
  --with-hwloc=internal --with-libevent=internal --with-pmix=internal \
  --prefix=$HOME/installed/Compiler/clang-gfortran-15/openmpi/5.0.7 |& tee configure.clang-gfortran-15.log

mv config.log config.clang-gfortran-15.log
make -j6 |& tee make.clang-gfortran-15.log
make install |& tee makeinstall.clang-gfortran-15.log
make check |& tee makecheck.clang-gfortran-15.log

--]]

family("MPI")
prereq("clang-gfortran/15")

local compilername = "clang-gfortran-15"

local version = "5.0.7"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/clang-gfortran-15",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

-- OpenMPI has a bug on macOS that requires a short TMPDIR (if it's
-- too long, mpirun fails)
setenv("TMPDIR","/tmp")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))

-- setenv("OMPI_MCA_btl_tcp_if_include","lo0")
-- setenv("OMPI_MCA_io","ompio")
-- setenv("OMPI_MCA_btl","^tcp")
