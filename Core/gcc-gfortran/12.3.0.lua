-- stub routine for gcc-gfortran 12.3.0 ON M1 --
-- 
-- This was based on the M1 work from @iains (see https://github.com/iains/gcc-11-branch/issues/3#issuecomment-1141065779)
--
--   https://github.com/iains/gcc-12-branch/tree/gcc-12.3-darwin-r0
--
-- So cloned that branch:
--
--   git clone -b gcc-12.3-darwin-r0 git@github.com:iains/gcc-12-branch.git gcc-12.3-darwin-r0
--
-- Next, run:
--   
--   cd gcc-12.3-darwin-r0/
--   contrib/download_prerequisites
--
-- NOTE: Decided to follow what homebrew does and add the --with-sysroot option. This seems needed on
--       macOS now
--
-- Then, build in a build directory:
--
--   cd ..
--   mkdir build-gcc-12.3-from-git && cd build-gcc-12.3-from-git
--   ../gcc-12.3-darwin-r0/configure --prefix=$HOME/installed/Core/gcc-gfortran/12.3.0 \
--      --enable-languages=c,c++,fortran --with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk |& tee configure.log
--
--   make -j6 |& tee make.log
--   make install |& tee makeinstall.log
--
-- If you are paranoid, you can run:
--
--   make check |& tee makecheck.log
--
-- but it will take a looooooooong time

family("Compiler")

local version = "12.3.0"
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed/Core/gcc-gfortran")
local pkgdir = pathJoin(installdir,version)
local bindir = pathJoin(pkgdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/gcc-gfortran-12.3.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(bindir,"gcc"))
setenv("CXX",pathJoin(bindir,"g++"))
setenv("FC",pathJoin(bindir,"gfortran"))
setenv("F90",pathJoin(bindir,"gfortran"))
setenv("ESMA_FC","gfortran")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
