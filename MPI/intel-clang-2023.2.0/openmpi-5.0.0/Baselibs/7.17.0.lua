--[[
This was built using:

make -j4 install ESMF_COMM=openmpi ESMF_COMPILER=intelclang prefix=$HOME/installed/MPI/intel-clang-2023.2.0/openmpi-5.0.0/Baselibs/7.17.0/Darwin |& tee makeinstall.intel-clang-2023.2.0_openmpi-5.0.0.log

NOTE: xgboost will not build because Rosetta2 + clang + libomp from brew doesn't work

NOTE: To build curl on Parcel, I had to do:

  brew install automake autoconf libtool

then I had to make symlinks so that it could find these:

  ln -s $(brew --prefix)/bin/automake $HOME/bin/automake
  ln -s $(brew --prefix)/bin/aclocal $HOME/bin/aclocal
  ln -s $(brew --prefix)/bin/glibtool $HOME/bin/libtool

NOTE THE LAST ONE! Brew installs glibtool, so as not to collide with clang libtool


--]]

family("Baselibs")

local compilername = "intel-clang-2023.2.0"
local mpiname = "openmpi-5.0.0"

local version = "7.17.0"
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

-- Testing showed that when we built GEOS, it said it was trying to build
-- for macOS 10.6 or something stupid. So, for now we set this when we load
-- the Baselibs module as it didn't seem necessary before this
local sw_vers = subprocess("sw_vers -productVersion"):gsub("\n$","")
setenv("MACOSX_DEPLOYMENT_TARGET",sw_vers)
