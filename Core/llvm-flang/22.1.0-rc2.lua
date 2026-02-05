--[[ lmod for llvm-flang 22.1.0-rc2


Retrieved with:

https://github.com/llvm/llvm-project/releases/download/llvmorg-22.1.0-rc2/LLVM-22.1.0-rc2-macOS-ARM64.tar.xz

and then installed with:

mkdir -p $HOME/installed/Core/llvm-flang/22.1.0-rc2
tar -xf LLVM-22.1.0-rc2-macOS-ARM64.tar.xz -C $HOME/installed/Core/llvm-flang/22.1.0-rc2 --strip-components=1

--]]

family("Compiler")

local version = "22.1.0-rc2"
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,"Core","llvm-flang",version)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-22.1.0-rc2")
prepend_path("MODULEPATH", mdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))

setenv("CC",pathJoin(pkgdir,"bin","clang"))
setenv("CXX",pathJoin(pkgdir,"bin","clang++"))
setenv("FC",pathJoin(pkgdir,"bin","flang-new"))
setenv("F90",pathJoin(pkgdir,"bin","flang-new"))
