-- stub routine for clang + lfortran from conda
-- 
-- install lfortran from conda:
--   cd ~/Lfortran
--   wget https://github.com/conda-forge/miniforge/releases/download/23.11.0-0/Mambaforge-23.11.0-0-MacOSX-x86_64.sh
--   bash Mambaforge-23.11.0-0-MacOSX-x86_64.sh -b -p /Users/mathomp4/installed/Core/lfortran/0.33.0
--   /Users/mathomp4/installed/Core/lfortran/0.33.0/bin/mamba install -y -c conda-forge lfortran
--

family("Compiler")

local cbindir = pathJoin("/usr/bin")

local version = "0.33.0"
local compiler = "lfortran"
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed/Core",compiler,version)
local fbindir = pathJoin(installdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/lfortran-0.33.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cbindir,"clang")) 
setenv("CXX",pathJoin(cbindir,"clang++"))
setenv("FC",pathJoin(fbindir,"lfortran"))
setenv("F90",pathJoin(fbindir,"lfortran"))

-- per scivision, set OpenMP_ROOT for clang: https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
local homebrewdir = pathJoin(homedir,".homebrew/brew")
setenv("OpenMP_ROOT",pathJoin(homebrewdir,"opt/libomp"))
