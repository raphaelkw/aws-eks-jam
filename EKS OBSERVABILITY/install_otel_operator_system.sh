#!/bin/bash

export repository_name=open-telemetry
export repository_url=https://open-telemetry.github.io/opentelemetry-helm-charts
export name=my-operator
export chart=open-telemetry/opentelemetry-operator
export namespace=opentelemetry-operator-system

# install helm repo
helm repo add ${repository_name} ${repository_url}
helm repo update

# install opemtelemetry operator using helm
helm install ${name} ${chart} \
  --namespace ${namespace} \
  
# verify opemtelemetry operator installation
helm ls -A
kubectl get all -n opentelemetry-operator-system