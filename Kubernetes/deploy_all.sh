#!/usr/bin/env bash

# Nome do namespace
NAMESPACE="dev"

print_red() {
  echo -e "\033[0;31m$1\033]0m"
}

apply_manifest() {
  echo -e "\nAplicando manifestos para $1..."
  kubectl apply -f "$1" -n "$NAMESPACE"
  echo -e "Manifestos para $1 aplicados com sucesso.\n"
}

# Deploy ALL
print_red "
   #########  ########  ########  #        ########  #   #
   #      ##  #         #      #  #        #      #   # #
   #     ##   #         #      #  #        #      #    #
   #    ##    ####      ########  #        #      #    #
   #   ##     #         #         #        #      #    #
   #####      ########  #         #######  ########    #
"


# Aplicar namespace.yaml
apply_manifest "namespace.yaml"

# Aplicar configMap.yaml no namespace dev
apply_manifest "configMap.yaml"

# Aplicar secret.yaml no namespace dev
apply_manifest "secret.yaml"

# Aplicar Ingress
apply_manifest "ingress.yaml"

# Obter status dos pods no namespace dev
kubectl get pods -n dev

# Aplicar manifestos nos diretórios específicos
apply_manifest "manifests/postgresql/"
apply_manifest "manifests/api-auth/"
apply_manifest "manifests/frontend/"
apply_manifest "manifests/api-crud/"
apply_manifest "manifests/zookeeper/"
apply_manifest "manifests/kafka/"
apply_manifest "manifests/kconnect/"
apply_manifest "manifests/api-processamento-ordens/"

# Verificar status dos pods
echo -e "\nStatus dos pods:"
kubectl get pods -n "$NAMESPACE"

