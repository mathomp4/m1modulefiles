--[[

This was cloned with:

  git clone -j 4 --recurse-submodules -b v8.19.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-8.19.0/src

This was built using:

make -j6 install ESMF_COMM=openmpi ESMF_BOPT=g ESMF_COMPILER=gfortranclang prefix=$HOME/installed/MPI/clang-gfortran-15/openmpi-5.0.7/Baselibs/8.19.0/Darwin |& tee makeinstall.clang-gfortran-15_openmpi-5.0.7.log

NOTE: For unknown reasons, for now gfortran + macOS means we need to build with ESMF_BOPT=g, see https://github.com/GEOS-ESM/MAPL/issues/3268

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
prereq("clang-gfortran/15", "openmpi/5.0.7")

local compilername = "clang-gfortran-15"
local mpiname = "openmpi-5.0.7"

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
