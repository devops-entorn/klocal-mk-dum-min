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

install_script() {
cp ./bin/entorn-$1 $HOME/.local/bin
chmod +x $HOME/.local/bin/entorn-$1
if [ ! -L "$HOME/.local/bin/entorn_$1" ]; then
	ln -s $HOME/.local/bin/entorn-$1 $HOME/.local/bin/entorn_$1
fi
echo "entorn-$1 is now available"
echo
}

install_script mount
install_script restart
install_script stop
install_script start

cp ./k8s-ilg-local/config.yaml $HOME/.local/

cd ./k8s-ilg-local/
./install-k8s-entorn.sh

exit 0

