#!/bin/bash

set -e

RELEASE=jupyterhub
NAMESPACE=entorn
VERSION=1.1.3-n616.he76e1e57

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=$VERSION \
  --values config.yaml

echo
echo "Entorn successfully started !"
echo "Visit https://local.entorn.io"
echo
exit 0
