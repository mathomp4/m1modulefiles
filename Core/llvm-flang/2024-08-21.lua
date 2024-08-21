--[[ lmod for llvm-flang built on 2024-08-21

The build script I use is at:

  https://github.com/GMAO-SI-Team/build-llvm-flang

which is based on the scivision gist at:

  https://gist.github.com/scivision/33bd9e17c9520d07be0448fe61541605

Then build with:

cd $HOME/build-llvm-flang
mkdir -p $HOME/build-llvm-flang/tmp

TMPDIR=$HOME/build-llvm-flang/tmp LLVM_PREFIX=$HOME/installed/Core ./build-flang-f18.sh |& tee build.2024-08-21.log

Also you might need to run:

  ulimit -n 65536

but this is currently in the build script

--]]

family("Compiler")

local version = "2024-08-21"
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,"Core","llvm-flang",version)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-2024-08-21")
prepend_path("MODULEPATH", mdir)

prepend_path("PATH",pathJoin(installdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("INCLUDE",pathJoin(installdir,"include"))
prepend_path("MANPATH",pathJoin(installdir,"share/man"))

setenv("CC",pathJoin(installdir,"bin","clang"))
setenv("CXX",pathJoin(installdir,"bin","clang++"))
setenv("FC",pathJoin(installdir,"bin","flang-new"))
setenv("F90",pathJoin(installdir,"bin","flang-new"))
