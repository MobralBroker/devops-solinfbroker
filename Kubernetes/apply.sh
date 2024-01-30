  #/usr/bin/env bash

  kubectl apply -f namespaces.yaml
  kubectl apply -f configMap.yaml -n dev
  kubectl apply -f secret.yaml -n dev
  kubectl apply -f ingress.yaml -n dev
  kubectl apply -f postgresql/. -n dev
  kubectl apply -f api-auth/. -n dev
  kubectl apply -f zookeeper/. -n dev
  kubectl apply -f kafka/. -n dev
  kubectl apply -f kconnect/. -n dev
  kubectl apply -f api-crud/. -n dev
  kubectl apply -f api-processamento-ordens/. -n dev
kubectl apply -f frontend/. -n dev












