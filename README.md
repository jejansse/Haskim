# Haskim

A Haskell IDE based on the [spf-13](http://github.com/spf13/spf13-vim) VIM distribution and the [neco-ghc](http://github.com/ujihisa/neco-ghc), [vim2hs](http://github.com/dag/vim2hs) and [ghcmod-vim](http://github.com/eagletmt/ghcmod-vim) VIM packages. Among others it features auto-completion (even on imported module references), automatic code checking on save, auto bracket completion and many other things. For a detailed list of features see the aforementioned package links. Note that I do not take credit for implementing these features; Haskim is just a convenient wrapper script for automatically installing and building all the required packages that make this happen.

Note: the spf13-vim install script will backup your existing `.vimrc`. You should probably add the contents of this backup to `.vimrc.local`. Unless you know what you are doing, do *not* overwrite `.vimrc.local` with your `.vimrc` backup since the former contains some fixes for tab-completion in spf13-vim and the automatic checking of your code on write.

# Installation

## Linux, \*nix, Mac OS X and Cygwin Installation

Installation on any OS with bash or sh should be as easy as executing the following line:

```bash
curl https://raw.github.com/jejansse/Haskim/master/bootstrap.sh -L -o - | sh
```

At a certain point in the installation you will see an empty VIM window. Just type :q! followed by a carriage return and the installation should proceed.
You might notice that the terminal will be garbled after closing this VIM window, this is due to spf13-vim and Vundle. Just close it and start a new one to test Haskim.

## Installing on Windows

If you're using Cygwin, the above script should work; otherwise, it probably won't work.
Normally, you can still pretty much get the same setup on Windows by installing spf13-vim, vim2hs, neco-ghc and ghcmod-vim manually, however.

## Prerequisites

You should have cabal installed and have added the directory with cabal installed binaries to your PATH variable:

```bash
echo $PATH
```
should contain a directory like cabal/bin on Linux or Library/Haskell/bin on Mac.

## Features

### Specific features

### spf-13

See http://github.com/spf13/spf13-vim for a complete list.

### vim2hs

See http://github.com/dag/vim2hs for a complete list.

### neco-ghc

See http://github.com/ujihisa/neco-ghc for a complete list.

### ghcmod-vim

See http://github.com/eagletmt/ghcmod-vim for a complete list.

## Issues

After closing the VIM window that pops up during the installation, the terminal where you ran the bootstrap script will be garbled.
This is due to spf13-vim or Vundle and cannot be fixed right now. If you want to have it fixed, please contact the maintainers of these packages.
