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


cd ./k8s-ilg-local/
./install-k8s-entorn.sh

exit 0
