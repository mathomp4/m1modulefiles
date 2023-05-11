-- stub routine for clang + gfortran-12 from brew  
-- 

family("Compiler")

local version = "12.2.0"
local homedir = os.getenv("HOME")
local homebrewdir = pathJoin(homedir,".homebrew/brew")
local cbindir = pathJoin("/usr/bin")
local fbindir = pathJoin(homebrewdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/clang-gfortran-12.2.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cbindir,"clang"))
setenv("CXX",pathJoin(cbindir,"clang++"))
setenv("FC",pathJoin(fbindir,"gfortran-12"))
setenv("F90",pathJoin(fbindir,"gfortran-12"))

-- prepend_path("PATH",pathJoin(pkgdir,"bin"))
-- prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
-- prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
-- prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
-- prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
-- prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
