#!/bin/bash

set +e

echo
echo "#### Installing Entorn in local Docker Desktop ####"
echo
echo "Setting environment ready ..."
echo 
./get_helm.sh
./create-namespace.sh
./create-ingress.sh
./helm-jupyterhub-install.sh
./set-storage-docker-desktop.sh

echo
echo "K8s environment is ready now."
echo "You may start entorn now."
echo

exit 0
