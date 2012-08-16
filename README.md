# Haskim

A Haskell IDE based on spf-13 and VIM with auto-completion, auto-checking of code on write, quick-fix support for ghc and more.

# Installation

## Linux, \*nix, Mac OS X and Cygwin Installation

Installation on any OS with bash or sh should be as easy as executing the following line:

```bash

    curl http://github.com/jejansse/Haskim/bootstrap.sh -L -o - | sh
    
```

## Installing on Windows

If you're using Cygwin, the above script should work; otherwise, it probably won't work.
Normally, you can still pretty much get the same setup on Windows by installing spf13-vim, vim2hs, neco-ghc and ghcmod-vim manually, however.

## Prerequisites

You should have cabal installed. All the other things are handled by the bootstrap script.

## Features

### Specific features

TODO: add auto-check of ghcmod on write in custom `.vimrc.local` (see ghcmod wiki).

### spf-13

See http://github.com/spf13/spf13-vim for a complete list.

### vim2hs

See http://github.com/dag/vim2hs for a complete list.

### neco-ghc

See http://github.com/ujihisa/neco-ghc for a complete list.

### ghcmod-vim

See http://github.com/eagletmt/ghcmod-vim for a complete list.