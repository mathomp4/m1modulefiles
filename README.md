# Collection of modulefiles created on Alderaan

## Installing Brew

For a Mac with no admin rights, I often just [clone homebrew](https://docs.brew.sh/Installation#untar-anywhere-unsupported) into my home directory. This is not
the *recommended* way to install homebrew, but it works.

```bash
mkdir -p $HOME/.homebrew
git clone https://github.com/Homebrew/brew $HOME/.homebrew
export BREWPATH=$HOME/.homebrew
```

Then (if on zsh):

```bash
eval "$($BREWPATH/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"
```

You should also add the following to your `.zshenv` or `.zshrc`:

```bash
export BREWPATH=$HOME/.homebrew
eval "$($BREWPATH/bin/brew shellenv)"
```

## Using with lmod

You should also install `lmod` with brew, and use this to get the modulefiles into my environment:

```
. $(brew --prefix)/opt/lmod/init/zsh
export MODULEPATH_ROOT=$HOME/modulefiles
module use $MODULEPATH_ROOT/Core
```

where the `MODULEPATH_ROOT` points to where you install your module files. (I usually do `$HOME/modulefiles`.)

## Make sure BREWPATH is set in your environment

These modulefiles assume you'll have `BREWPATH` set in your environment so they
can find the Homebrew installation. You can do this by adding the following to
your `.bashrc` or `.zshrc`:

```
export BREWPATH=$(brew --prefix)
```
