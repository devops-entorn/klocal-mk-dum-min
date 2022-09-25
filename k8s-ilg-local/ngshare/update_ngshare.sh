#!/bin/bash
helm upgrade --namespace entorn  ngshare ngshare/ngshare -f config.yaml
exit 0
