#!/usr/bin/env sh

endpath="$HOME/.2ret-vim"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "thanks for installing 2ret-vim\n"

# Backup existing .vim stuff
echo "backing up current vim config\n"
today=`date +%F-%T`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && [ ! -L $file ] && mv $i $i.$today; done


echo "cloning 2ret-vim\n"
echo "backing up '2ret-vim' git repository before safely cloning latest version\n"
mv $endpath $endpath.$today
git clone --recursive http://github.com/benichu/2ret-vim.git $endpath
mkdir -p $endpath/.vim/bundle
ln -s $endpath/.vimrc $HOME/.vimrc
ln -s $endpath/.vimrc.bundles $HOME/.vimrc.bundles
ln -s $endpath/.vim $HOME/.vim

echo "Installing Vundle\n"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "installing plugins using Vundle\n"
vim -u $endpath/.vimrc.bundles - +BundleInstall! +BundleClean +qall
echo "DONE!"
