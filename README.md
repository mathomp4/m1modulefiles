# Collection of modulefiles created on Wormhole

## Using with lmod

If you install `lmod` with brew, then this is how I am getting the modulefiles into my environment:

```
. $(brew --prefix)/opt/lmod/init/zsh
export MODULEPATH_ROOT=$HOME/modulefiles
module use $MODULEPATH_ROOT/Core
```

where the `MODULEPATH_ROOT` points to where you install your module files.


## Set BREWPATH in your environment

These modulefiles assume you'll have `BREWPATH` set in your environment so they
can find the Homebrew installation. You can do this by adding the following to
your `.bashrc` or `.zshrc`:

```
export BREWPATH=$(brew --prefix)
```
