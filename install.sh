#!/bin/bash

########## Variables
dir=~/dotfiles                  # dotfiles directory
olddir=~/dotfiles_old           # old dotfiles backup directory
files="vimrc zshrc minttyrc"    # list of files/folders to copy in homedir
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then copy new 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Copy $file in home directory."
    cp $dir/$file ~/.$file
done

# clone Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/

# copy solarized
#mkdir ~/.vim/autoload/
#mkdir ~/.vim/colors/
#cp togglebg.vim ~/.vim/autoload/togglebg.vim
#cp solarized.vim ~/.vim/colors/solarized.vim 


