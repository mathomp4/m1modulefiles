--[[

This was built using:

ml llvm-flang/22.1.0

mkdir build-llvm-flang-22.1.0 && cd build-llvm-flang-22.1.0

../configure \
   CC=/Users/mathomp4/installed/Core/llvm-flang/22.1.0/bin/clang \
   CXX=/Users/mathomp4/installed/Core/llvm-flang/22.1.0/bin/clang++ \
   FC=/Users/mathomp4/installed/Core/llvm-flang/22.1.0/bin/flang \
  --prefix=$HOME/installed/Compiler/llvm-flang-22.1.0/mpich/4.3.2 |& tee configure.llvm-flang-22.1.0.log

mv config.log config.llvm-flang-22.1.0.log
make -j6 |& tee make.llvm-flang-22.1.0.log
make install |& tee makeinstall.llvm-flang-22.1.0.log
make check |& tee makecheck.llvm-flang-22.1.0.log

--]]

family("MPI")
prereq("llvm-flang/22.1.0")

local compilername = "llvm-flang-22.1.0"

local version = "4.3.2"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"mpich",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/llvm-flang-22.1.0",("mpich-"..version))
prepend_path("MODULEPATH", mdir)

setenv("MPICH",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
