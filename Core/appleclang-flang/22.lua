-- stub routine for apple clang + flang-22 from brew
--
-- install flang-22 via:
--   brew install flang@22
--
-- NOTE: We are using Apple Clang not LLVM Clang from brew

family("Compiler")

local version = "22"
local homedir = os.getenv("HOME")
local homebrewdir = os.getenv("BREWPATH")
local cbindir = pathJoin("/usr/bin")
local fbindir = pathJoin(homebrewdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/appleclang-flang-22")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cbindir,"clang"))
setenv("CXX",pathJoin(cbindir,"clang++"))
setenv("FC",pathJoin(fbindir,"flang-22"))
setenv("F90",pathJoin(fbindir,"flang-22"))

-- per scivision, set OpenMP_ROOT for clang: https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
setenv("OpenMP_ROOT",pathJoin(homebrewdir,"opt/libomp"))

-- Homebrew flang does not have libomp. We have a choice to use llvm's or libomp. For now
-- I use libomp. why? I dunno. it works.
-- Add libomp to the linker search path
prepend_path("LIBRARY_PATH",pathJoin(homebrewdir,"opt/libomp/lib"))

-- Optional but recommended: Add the include path for the compiler
prepend_path("CPATH", pathJoin(homebrewdir,"opt/libomp/include"))

-- This was apparently needed in the past, but at the moment, doesn't
-- seem to be necessary. Keeping it commented out for now.
-- setenv("LDFLAGS","-lc++")
