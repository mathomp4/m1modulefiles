--[[

This was cloned with:

git clone -j 4 --recurse-submodules -b v9.12.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-9.21.0-ESMFFlang/src

I then updated ESMF to develop and *undid* my patch for ESMF in the GNUmakefile

This was built using:

ml appleclang-flang/22 openmpi/5.0.10

NOTE: We seem to need ESMF_BOPT=g again to avoid some ESMF/MAPL issues

make -j6 install ESMF_COMM=openmpi ESMF_COMPILER=llvm ESMF_BOPT=g prefix=$HOME/installed/MPI/appleclang-flang-22/openmpi-5.0.10/Baselibs/9.21.0-ESMFFlang/Darwin |& tee makeinstall.appleclang-flang-22_openmpi-5.0.10.log

NOTE: To build curl on Parcel, I had to do:

  brew install automake autoconf libtool

then I had to make symlinks so that it could find these:

  ln -s $(brew --prefix)/bin/automake $HOME/bin/automake
  ln -s $(brew --prefix)/bin/aclocal $HOME/bin/aclocal
  ln -s $(brew --prefix)/bin/glibtool $HOME/bin/libtool

NOTE THE LAST ONE! Brew installs glibtool, so as not to collide with clang libtool

Also: To build udunits2 (and then nco and cdo) you need to install the texinfo package

  brew install texinfo

as udunits2 needs makeinfo.

--]]

family("Baselibs")

local compilername = "appleclang-flang-22"
local mpiname = "openmpi-5.0.10"

local version = myModuleVersion()
local pathdir = pathJoin("MPI",compilername,mpiname)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,pathdir,"Baselibs",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Baselibs",compilername,mpiname)
prepend_path("MODULEPATH", mdir)

setenv("BASEDIR",pkgdir)
setenv("basedir",pkgdir)
setenv("BASEBIN",pathJoin(pkgdir,"Darwin/bin"))

prepend_path("PATH",pathJoin(pkgdir,"Darwin/bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"Darwin/lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"Darwin/lib"))
prepend_path("MANPATH",pathJoin(pkgdir,"Darwin/share/man"))

setenv("UDUNITS2_XML_PATH",pathJoin(pkgdir,"Darwin/share/udunits/udunits2.xml"))
