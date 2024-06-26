-- module file for llvm-flang 18.1.0-rc2
--
-- Built following the instructions at:
--    https://flang.llvm.org/docs/GettingStarted.html#building-flang-in-tree
--
-- Steps:
--    wget https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-18.1.0-rc2.tar.gz
--    tar -xf llvmorg-18.1.0-rc2.tar.gz
--    cd llvm-project-llvmorg-18.1.0-rc2
--    cmake -B build-llvm -S llvm -G Ninja \
--      --install-prefix=$HOME/installed/Core/llvm-flang/18.1.0-rc2 \
--      -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=17 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
--      -DCMAKE_CXX_LINK_FLAGS="-Wl,-rpath,$LD_LIBRARY_PATH" -DFLANG_ENABLE_WERROR=ON \
--      -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_TARGETS_TO_BUILD=host -DLLVM_LIT_ARGS=-v \
--      -DLLVM_ENABLE_PROJECTS="clang;mlir;flang;openmp" -DLLVM_ENABLE_RUNTIMES="compiler-rt" \
--      -DDEFAULT_SYSROOT="$(xcrun --show-sdk-path)"
--    cmake --build build-llvm --target check-flang
--

family("Compiler")

local version = "18.1.0-rc2"
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,"Core","llvm-flang",version)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-18.1.0-rc2")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(pkgdir,"clang"))
setenv("CXX",pathJoin(pkgdir,"clang++"))
setenv("FC",pathJoin(pkgdir,"gfortran-12"))
setenv("F90",pathJoin(pkgdir,"gfortran-12"))

-- per scivision, set OpenMP_ROOT for clang: https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
setenv("OpenMP_ROOT",pathJoin(pkgdir,"opt/libomp"))
