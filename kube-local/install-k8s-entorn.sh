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

kubectl --namespace=entorn apply -f ssh-service.yaml

echo
echo "K8s environment is ready now."
echo "You may start entorn now running entorn-start"
echo

exit 0
