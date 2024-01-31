#!/usr/bin/env bash

# Função para exibir informações
display_info() {
  echo "--------------------------------------------"
  echo "$1"
  echo "--------------------------------------------"
}

# Criar cluster k3d
k3d cluster create solinfbroker -p "8081:80@loadbalancer" --agents=3 --k3s-arg "--disable=traefik@server:0"
display_info "Cluster 'solinfbroker' criado com sucesso."

# Aplicar namespaces
kubectl apply -f namespaces.yaml
display_info "Namespaces aplicados com sucesso."

# Instalar Ingress Controller
helm install --namespace ingress ingress bitnami/nginx-ingress-controller
display_info "Ingress Controller instalado com sucesso."

# Aplicar ConfigMap
kubectl apply -f configMap.yaml -n prod
display_info "ConfigMap aplicado com sucesso."

# Aplicar Secret
kubectl apply -f secret.yaml -n prod
display_info "Secret aplicado com sucesso."

# Aplicar Ingress
kubectl apply -f ingress.yaml -n prod
display_info "Ingress aplicado com sucesso."

# Aplicar recursos do PostgreSQL
kubectl apply -f postgresql/. -n prod
display_info "Recursos do PostgreSQL aplicados com sucesso."

# Instalar API Autenticação
cd api-autenticacao
helm install api-autenticacao . -n prod
cd ..
display_info "API Autenticação instalada com sucesso."

# Instalar API CRUD
cd api-crud
helm install api-crud . -n prod
cd ..
display_info "API CRUD instalada com sucesso."

# Aplicar recursos do Zookeeper
kubectl apply -f zookeeper/. -n prod
display_info "Recursos do Zookeeper aplicados com sucesso."

# Aplicar recursos do Kafka
kubectl apply -f kafka/. -n prod
display_info "Recursos do Kafka aplicados com sucesso."

# Aplicar recursos do Kafka Connect
kubectl apply -f kconnect/. -n prod
display_info "Recursos do Kafka Connect aplicados com sucesso."

# Instalar API Envio Dados
cd api-envio-dados
helm install api-envio-dados . -n prod
cd ..
display_info "API Envio Dados instalada com sucesso."

# Instalar API Processamento Ordens
cd api-processamento-ordens
helm install api-processamento-ordens . -n prod
cd ..
display_info "API Processamento Ordens instalada com sucesso."

# Instalar Frontend Broker
cd frontend-broker
helm install frontend-helm . -n prod
cd ..
display_info "Frontend Broker instalado com sucesso."


