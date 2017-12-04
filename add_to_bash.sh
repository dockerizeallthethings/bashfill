#!/bin/bash

mkdir -p $HOME/.dockerizeit/

cp -R . $HOME/.dockerizeit

chmod +x $HOME/.dockerizeit/bin/*

declare -a commands_to_add_to_bash=('' '# Setting PATH from dockerizeit' '# Check it out at https://github.com/dockerizeallthethings/bashfill' 'export PATH=$HOME/.dockerizeit/bin:$PATH')

if [ -f  "$HOME/.bashrc" ]; then
	for line in "${commands_to_add_to_bash[@]}"
	do
		echo "$line" >> $HOME/.bashrc
	done
	source ~/.bashrc
elif [ -f "$HOME/.bash_profile" ]; then
	for line in "${commands_to_add_to_bash[@]}"
	do
		echo "$line" >> $HOME/.bash_profile
	done
	source ~/.bash_profile
else
	# inform that the user needs either bashrc or bash_profile to use this
	# check if it's linux or mac
	# if mac, ask if the user minds if we create bash_profile
	# if yes (i.e. do not create any files, and exit now)
	# - end
	# if no (i.e. yes, create the file, and add commands that will change the behavior of my bash shell)
	# - create a file containing $commands_to_add_to_bash
	exit 0
fi
