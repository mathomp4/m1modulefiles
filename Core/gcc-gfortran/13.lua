-- stub routine for clang + gfortran-13 from brew
--
-- install gcc-13 via:
--   brew install gcc@13

family("Compiler")

local version = "13"
local homedir = os.getenv("HOME")
local homebrewdir = os.getenv("BREWPATH")
local cbindir = pathJoin(homebrewdir,"bin")
local fbindir = pathJoin(homebrewdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/gcc-gfortran-13")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cbindir,"gcc-13"))
setenv("CXX",pathJoin(cbindir,"g++-13"))
setenv("FC",pathJoin(fbindir,"gfortran-13"))
setenv("F90",pathJoin(fbindir,"gfortran-13"))

-- per scivision, set OpenMP_ROOT for clang: https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
setenv("OpenMP_ROOT",pathJoin(homebrewdir,"opt/libomp"))

-- per scivision, add SDKROOT
setenv("SDKROOT","/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk")
