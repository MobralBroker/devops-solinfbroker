**Manual Rápido: Configurando o KIND**

Este é um guia rápido para configurar o KIND (Kubernetes in Docker) e acessar um banco de dados PostgreSQL no Kubernetes usando o DBeaver. Certifique-se de ter o Docker instalado na sua máquina antes de começar.

**1. Instalação do KIND:**

```bash
# Para AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64

# Para ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64

chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

**2. Configuração do Cluster Kubernetes com KIND:**

```bash
# Crie e inicie o cluster
kind create cluster --name solinf-broker

