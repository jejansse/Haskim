PLATFORM=`uname`
PREFIX="${HOME}"

cd $PREFIX

echo "Getting custom .vimrc.local"
curl http://bit.ly/Rx8H3u -L -o - >> ${PREFIX}/.haskim.vimrc.local
if [ -e ${PREFIX}/.vimrc.local ]
then
    echo "Custom .vimrc.local found; adding missing lines"
    comm -2 -3 ${PREFIX}/.haskim.vimrc.local ${PREFIX}/.vimrc.local >> ${PREFIX}/.vimrc.local
else
    cat ${PREFIX}/.haskim.vimrc.local >> ${PREFIX}/.vimrc.local
fi
rm ${PREFIX}/.haskim.vimrc.local

echo "Getting custom .vimrc.bundles.local"
curl http://bit.ly/Se6ur6 -L -o - >> ${PREFIX}/.haskim.vimrc.bundles.local
if [ -e ${PREFIX}/.vimrc.local ]
then
    echo "Custom .vimrc.bundles.local found; adding missing lines"
    comm -2 -3 ${PREFIX}/.haskim.vimrc.bundles.local ${PREFIX}/.vimrc.bundles.local >> ${PREFIX}/.vimrc.bundles.local
else
    cat ${PREFIX}/.haskim.vimrc.bundles.local >> ${PREFIX}/.vimrc.bundles.local
fi
rm ${PREFIX}/.haskim.vimrc.bundles.local

echo "Getting ghc-mod from hackage"
cabal install ghc-mod

echo "Installing spf13-vim"
curl http://j.mp/spf13-vim3 -L -o - | sh

echo "Building vimproc"
cd ${PREFIX}/.vim/bundle/vimproc/
if [ $PLATFORM = 'Darwin' ]
then
    make -f make_mac.mak
elif [ $PLATFORM = 'Cygwin' ]
then
    make -f make_cygwin.mak
elif [ $PLATFORM = 'Linux' ]
then
    make -f make_unix.mak
fi

cd $PREFIX

GHC_MOD_LOC=`which ghc-mod`
if test -z ${GHC_MOD_LOC}
then
    echo "WARNING: Could not find ghc-mod binary in PATH"
    echo "For a proper working of ghcmod-vim add the binary to your PATH"
fi

echo "All done! Enjoy Haskim!"

