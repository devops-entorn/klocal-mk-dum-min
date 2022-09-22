#!/bin/bash

kubectl --namespace entorn apply -f sc-standard.yaml 
kubectl --namespace entorn apply -f pvc-dockerdata-claim-mk.yaml
kubectl --namespace entorn apply -f pvc-apps-claim-mk.yaml
kubectl --namespace entorn apply -f pvc-dbdata-claim-mk.yaml
