-- -*- lua -*-

local homedir = os.getenv("HOME")
local spackdir = "spack"
local spackroot = pathJoin(homedir, spackdir)
setenv("SPACK_ROOT", spackroot)
source_sh("zsh", pathJoin(spackroot, "share/spack/setup-env.sh"))

-- Also we need to know where modules are installed
local spackarch = "darwin-ventura-aarch64"
local modulepath = pathJoin(spackroot, "share/spack/lmod", spackarch, "Core")
prepend_path("MODULEPATH", modulepath)
