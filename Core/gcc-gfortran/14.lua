-- stub routine for clang + gfortran-14 from brew
--
-- install gcc-14 via:
--   brew install gcc@14

family("Compiler")

local version = "14"
local homedir = os.getenv("HOME")
local homebrewdir = os.getenv("BREWPATH")
local cbindir = pathJoin(homebrewdir,"bin")
local fbindir = pathJoin(homebrewdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/gcc-gfortran-14")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cbindir,"gcc-14"))
setenv("CXX",pathJoin(cbindir,"g++-14"))
setenv("FC",pathJoin(fbindir,"gfortran-14"))
setenv("F90",pathJoin(fbindir,"gfortran-14"))

-- per scivision, set OpenMP_ROOT for clang: https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
setenv("OpenMP_ROOT",pathJoin(homebrewdir,"opt/libomp"))

-- per scivision, add SDKROOT
setenv("SDKROOT","/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk")
