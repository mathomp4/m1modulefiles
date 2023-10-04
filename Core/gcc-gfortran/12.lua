-- stub routine for clang + gfortran-12 from brew  
-- 
-- install gcc-12 via:
--   brew install gcc@12

family("Compiler")

local version = "12"
local homedir = os.getenv("HOME")
local homebrewdir = pathJoin(homedir,".homebrew/brew")
local cbindir = pathJoin(homebrewdir,"bin")
local fbindir = pathJoin(homebrewdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/gcc-gfortran-12")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cbindir,"gcc-12"))
setenv("CXX",pathJoin(cbindir,"g++-12"))
setenv("FC",pathJoin(fbindir,"gfortran-12"))
setenv("F90",pathJoin(fbindir,"gfortran-12"))

-- per scivision, set OpenMP_ROOT for clang: https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
setenv("OpenMP_ROOT",pathJoin(homebrewdir,"opt/libomp"))
