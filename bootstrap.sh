#!/usr/bin/env sh

endpath="$HOME/.2ret-vim"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
    if [ -L $2 ] ; then
        ln -sf $1 $2
    fi
}

echo "thanks for installing 2ret-vim\n"

# Backup existing .vim stuff
echo "backing up current vim config\n"
today=`date +%F-%T`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && [ ! -L $file ] && mv $i $i.$today; done

if [ ! -e $endpath/.git ]; then
    echo "cloning 2ret-vim\n"
    git clone --recursive http://github.com/benichu/2ret-vim.git $endpath
else
    echo "updating 2ret-vim\n"
    cd $endpath && git pull
fi

echo "setting up symlinks"
lnif $endpath/.vimrc $HOME/.vimrc
lnif $endpath/.vimrc.bundles $HOME/.vimrc.bundles
lnif $endpath/.vim $HOME/.vim
if [ ! -d $endpath/.vim/bundle ]; then
    mkdir -p $endpath/.vim/bundle
fi

if [ ! -e $HOME/.vim/bundle/vundle ]; then
    echo "Installing Vundle\n"
    git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

echo "installing plugins using Vundle\n"
vim -u $endpath/.vimrc.bundles - +BundleInstall! +BundleClean +qall
