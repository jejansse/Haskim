#!/usr/bin/env sh

endpath="$HOME/.spf13-vim-haskell"

echo "Thanks for installing spf13-vim-haskell\n"

# Backup existing .vim stuff
echo "Backing up current vim config\n"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done


echo "Cloning spf13-vim\n"
git clone --recursive -b 3.0 http://github.com/spf13/spf13-vim.git $endpath
mkdir -p $endpath/.vim/bundle
ln -s $endpath/.vimrc $HOME/.vimrc
ln -s $endpath/.vim $HOME/.vim

echo "Checking whether cabal is installed\n"
if which -s cabal;
then
    echo "Cabal found!\n"
else
    echo "FATAL: Cabal was not found!\n"
    exit 1
fi

echo "Installing ghc-mod\n"
cabal install ghc-mod

echo "Installing Vundle\n"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "Adding Haskell VIM plugins (vim2hs, neco-ghc, ghcmod-vim)\n"
if grep -q vim2hs ~/.vimrc.localc.bundles.local;
then
    echo Bundle \'dag/vim2hs\' >> ~/.vimrc.bundles.local
fi
if grep -q neco-ghc ~/.vimrc.bundles.local;
then
    echo Bundle \'ujihisa/neco-ghc\' >> ~/.vimrc.bundles.local
fi
if grep -q vimproc ~/.vimrc.bundles.local;
then
    echo Bundle \'Shougo/vimproc\' >> ~/.vimrc.bundles.local
fi
if grep -q ghcmod-vim ~/.vimrc.bundles.local;
then
    echo Bundle \'eagletmt/ghcmod-vim\' >> ~/.vimrc.bundles.local
fi

echo "Installing plugins using Vundle\n"
vim +BundleInstall! +BundleInstallleClean +q

echo "Compiling vimproc\n"
cd ~/.vim/bundle/vimproc/
uname=`uname`
if [ $uname == 'Linux' ];
then
    make -f make_unix.mak
elif [ $uname == 'Darwin' ];
then
    make -f makeke_mac.mak
elif [ $uname == 'Cygwin' ];
then
    make -f make_cygwin.mak
fi

cd

"Checking whether ghc-mod is in PATH\n"
if which -q ghc-mod;
then
    echo "Ok, ghc-mod found!\n"
else
    echo "WARNING: ghc-mod not found! For proper working of spf13-vim-haskell add the cabal bin directory to your PATH.\n"

echo "All done! Enjoy spf13-vim-haskell\n"

