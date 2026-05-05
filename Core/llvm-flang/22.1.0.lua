--[[ lmod for llvm-flang 22.1.0

The build script I use is at:

  https://github.com/GMAO-SI-Team/build-llvm-flang

which is based on the scivision gist at:

  https://gist.github.com/scivision/33bd9e17c9520d07be0448fe61541605

Then build with:

cd $HOME/build-llvm-flang
mkdir -p $HOME/build-llvm-flang/tmp

Then build with:
TMPDIR=$HOME/build-llvm-flang/tmp CC=/usr/bin/clang CXX=/usr/bin/clang++ ./build-flang.sh --prefix=$HOME/installed/Core --llvm-version=22.1.0 --procs=6 |& tee build.22.1.0.log

If/when the build fails, you can rebuild with:

TMPDIR=$HOME/build-llvm-flang/tmp CC=/usr/bin/clang CXX=/usr/bin/clang++ ./build-flang.sh --prefix=$HOME/installed/Core --llvm-version=22.1.0 --procs=6 --rebuild |& tee build.22.1.0.rebuild.log

NOTE 1: I have to do the rebuild thing because, for some reason, the first build fails on bucy every time. But you just re run the build command
        and it works. Seems race condition like?
NOTE 2: the script automatically appends "llvm-flang" to the prefix and then the --llvm-version=22.1.0 option adds the version to the end of the directory name.

Also you might need to run:

  ulimit -n 65536

but this is currently in the build script

--]]

family("Compiler")

local version = "22.1.0"
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,"Core","llvm-flang",version)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-22.1.0")
prepend_path("MODULEPATH", mdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))

setenv("CC",pathJoin(pkgdir,"bin","clang"))
setenv("CXX",pathJoin(pkgdir,"bin","clang++"))
setenv("FC",pathJoin(pkgdir,"bin","flang-new"))
setenv("F90",pathJoin(pkgdir,"bin","flang-new"))
