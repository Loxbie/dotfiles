#!/bin/bash

dir=~/dotfiles			# dotfiles directory
backupdir=~/dotfiles.backup	# dorfiles backup directory
# list of files/folders to symlink in homedir
files=".bashrc .config/kitty .config/sway .config/waybar .config/swaynag .local/share/konsole/Lox.profile .local/share/konsole/Breeze.colorscheme .local/share/konsole/konsolestaterc .config/konsolerc"


echo "Creating $bakupdir to backup any existing dotfiles in ~"
mkdir -p $backupdir
echo "... done"

cd $dir

# move existing dotfiles in homedir to backupdir, 
# then create symlinks

for file in $files; do
	mv ~/$file ${backupdir}/ && echo "Moved $file to ${backupdir}/${file}"
	ln -s ${dir}/${file} ~/${file} && echo "Created symlink to ~/${file}"
done
