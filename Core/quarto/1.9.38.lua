--[[ Modulefile for quarto

First get it:

wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.38/quarto-1.9.38-macos.tar.gz

we will then install to:

$HOME/installed/Core/quarto/1.9.38

the tarfile when unzipped has a bin/ and share/ directory.

mkdir -p $HOME/installed/Core/quarto/1.9.38
tar -xzf quarto-1.9.38-macos.tar.gz -C $HOME/installed/Core/quarto/1.9.38

--]]

local version = "1.9.38"
local homedir = os.getenv("HOME")

local pkgdir = pathJoin(homedir, "installed/Core/quarto", version)

prepend_path("PATH", pathJoin(pkgdir, "bin"))
prepend_path("MANPATH", pathJoin(pkgdir, "share/man"))

