#!/usr/bin/env bash
########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
vundledir=~/.vim/bundle/vundle     # vundle dir we need to check for

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files

for f in * 
	do 
		if [ $f != makesymlinks.sh ]; then 
			echo "Moving any existing dotfiles from ~ to $olddir"
			mv ~/.$f $olddir/ 
			echo "Creating symlink to $f in home directory."
			ln -s $dir/$f ~/.$f
		fi
done

#clone vundle and install our plugins
if [ ! -d "$vundledir" ]; then
	# Control will enter here if $DIRECTORY doesn't exist.
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +PluginInstall +qall

