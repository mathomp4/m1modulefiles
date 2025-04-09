--[[ File for GEOSpyD

Installed using the GEOSpyD installer script on github:

  git@github.com:GMAO-SI-Team/GEOSpyD.git

and I ran

  ./install_miniforge.bash --python_version 3.13 --miniforge_version 24.11.3-0 --prefix /Users/mathomp4/installed/Core/GEOSpyD |& tee install.24.11.3-0_py3.13.log

NOTE: You'll need to set the date below!
--]]

family("Python3")

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed/Core/GEOSpyD")

local miniforge_version = "24.11.3-0"
local python_version = "py3.13"
local builddate = "2025-04-09"

local pathdir = pathJoin(miniforge_version,builddate,'envs',python_version)
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
-- local mroot = os.getenv("MODULEPATH_ROOT")
-- local mdir  = pathJoin(mroot,"GEOSpyD",miniforge_version)
-- prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PROJ_LIB",pathJoin(pkgdir,"share/proj"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
