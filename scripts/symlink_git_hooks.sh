#!/bin/bash

base=$HOME

# If no HOME directory was set, use a BASE directory that is /home/dev
if [ ! $base ]
then
    base=/home/dev
fi

source_directory=$base/Sources/OSGP
target_directory=*/.git/hooks

cd $source_directory
git_hook_directories=$(ls -d $target_directory)

for directory in $git_hook_directories;
do
	echo symlinking the pre-commit hook to $directory
	ln -sf $source_directory/Config/git_hooks/pre-commit $directory 
done
