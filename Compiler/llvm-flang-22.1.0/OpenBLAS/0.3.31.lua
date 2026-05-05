--[[ Ugly Lua module for OpenBLAS

Built as:

ml llvm-flang/22.1.0

cmake -B build-llvm-flang-22.1.0 -S . --install-prefix=$HOME/installed/Compiler/llvm-flang-22.1.0/OpenBLAS/0.3.31 |& tee configure.llvm-flang-22.1.0.log
cmake --build build-llvm-flang-22.1.0 -j4 |& tee build.llvm-flang-22.1.0.log
cmake --install build-llvm-flang-22.1.0 |& tee install.llvm-flang-22.1.0.log

--]]

local compilername = "llvm-flang-22.1.0"

local version = "0.3.31"
local name = "OpenBLAS"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"OpenBLAS",version)

whatis([===[loads the OpenBLAS 0.3.31 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("CMAKE_PREFIX_PATH",pathJoin(pkgdir,"lib64/cmake"))
prepend_path("PKG_CONFIG_PATH",pathJoin(pkgdir,"lib64/pkgconfig"))
