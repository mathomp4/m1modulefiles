-- stub routine for clang + gfortran-15.1.0 from a hand-build
--
-- This is based on a handbuild of gcc 15.1.0

family("Compiler")

local homedir = os.getenv("HOME")
local cbindir = pathJoin("/usr/bin")

local gccdir = "/Users/mathomp4/installed/Core/gcc-gfortran/15.1.0"
local fbindir = pathJoin(gccdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/clang-gfortran-15.1.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cbindir,"clang"))
setenv("CXX",pathJoin(cbindir,"clang++"))
setenv("FC",pathJoin(fbindir,"gfortran"))
setenv("F90",pathJoin(fbindir,"gfortran"))

-- per scivision, set OpenMP_ROOT for clang: https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
local homebrewdir = os.getenv("BREWPATH")
setenv("OpenMP_ROOT",pathJoin(homebrewdir,"opt/libomp"))
