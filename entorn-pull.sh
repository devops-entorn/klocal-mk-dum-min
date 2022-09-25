#!/bin/bash

ver="0.1.0"
local_base_name=entorn-io/singleuser
remote_base_name=pluralcamp/entorn-io

pull_image() {
docker pull ${remote_base_name}-$1:$ver
docker tag ${remote_base_name}-$1:$ver $local_base_name:$1-${ver}
docker rmi ${remote_base_name}-$1:$ver
}

pull_image dev
pull_image data
pull_image ops

docker pull ${remote_base_name}-hub:$ver
docker tag ${remote_base_name}-hub:$ver entorn-io/hub:${ver}
docker rmi ${remote_base_name}-hub:$ver

docker pull ${remote_base_name}-dind:$ver
docker tag ${remote_base_name}-dind:$ver entorn-io/dind:${ver}
docker rmi ${remote_base_name}-dind:$ver

docker images | grep entorn | grep "$ver"

echo 
echo "All entorn images pulled successfully."
echo

exit 0
