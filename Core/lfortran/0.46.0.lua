--[[ lmod for clang + lfortran from conda

install lfortran from conda:

cd ~/Lfortran
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh -b -p /Users/mathomp4/installed/Core/lfortran/0.46.0
/Users/mathomp4/installed/Core/lfortran/0.46.0/bin/mamba create -p /Users/mathomp4/installed/Core/lfortran/0.46.0/envs/lf
/Users/mathomp4/installed/Core/lfortran/0.46.0/bin/mamba install -n lf -y -c conda-forge lfortran

--]]

family("Compiler")

local cbindir = pathJoin("/usr/bin")

local version = "0.46.0"
local compiler = "lfortran"
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed/Core",compiler,version,"envs/lf")
local fbindir = pathJoin(installdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/lfortran-0.46.0")
prepend_path("MODULEPATH", mdir)

prepend_path("PATH",fbindir)

setenv("CC",pathJoin(cbindir,"clang"))
setenv("CXX",pathJoin(cbindir,"clang++"))
setenv("FC",pathJoin(fbindir,"lfortran"))
setenv("F90",pathJoin(fbindir,"lfortran"))

-- per scivision, set OpenMP_ROOT for clang: https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
local homebrewdir = os.getenv("BREWPATH")
setenv("OpenMP_ROOT",pathJoin(homebrewdir,"opt/libomp"))
