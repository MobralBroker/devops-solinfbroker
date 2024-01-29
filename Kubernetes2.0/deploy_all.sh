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

# Aplicar manifestos nos diretórios específicos
apply_manifest "postgresql/"
apply_manifest "api-auth/"
apply_manifest "frontend/"
apply_manifest "api-crud/"
apply_manifest "zookeeper/"
apply_manifest "kafka/"
apply_manifest "kconnect/"
apply_manifest "api-processamento-ordens/"

# Verificar status dos pods
echo -e "\nStatus dos pods:"
kubectl get pods -n "$NAMESPACE"

