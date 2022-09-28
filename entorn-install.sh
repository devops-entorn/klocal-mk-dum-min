#!/bin/bash

file="$HOME/.profile"

if grep -q "UserKnownHostsFile" "$file"; then
        echo
	echo "ssh alias already set." # String was found
        echo
else
        echo "alias ssh='ssh -o UserKnownHostsFile=/dev/null'" >> $file
	echo "alias sshfs='sshfs -o UserKnownHostsFile=/dev/null'" >> $file
        echo "ssh alias is now set."
        echo
fi

mkdir -p $HOME/.local/bin

cp ./bin/entorn-mount $HOME/.local/bin
chmod +x $HOME/.local/bin/entorn-mount
if [ ! -L "$HOME/.local/bin/entorn_mount" ]; then
	ln -s $HOME/.local/bin/entorn-mount $HOME/.local/bin/entorn_mount
fi
echo "entorn-mount is now available"
echo

cp ./bin/entorn-restart $HOME/.local/bin
chmod +x $HOME/.local/bin/entorn-restart
if [ ! -L "$HOME/.local/bin/entorn_restart" ]; then
        ln -s $HOME/.local/bin/entorn-restart $HOME/.local/bin/entorn_restart
fi
echo "entorn-restart is now available"
echo

cd ./k8s-ilg-local/
./install-k8s-entorn.sh

exit 0

