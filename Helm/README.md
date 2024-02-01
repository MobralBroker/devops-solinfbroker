# Guia de Instalação

## Pré-requisitos

Antes de iniciar a instalação, certifique-se de ter os seguintes requisitos instalados no seu sistema:

- [Docker](https://docs.docker.com/get-docker/)
- [k3d](https://k3d.io/)
- [Helm](https://helm.sh/)

## Passos para execução

1. **Crie o Cluster Kubernetes com k3d:**

   ```bash
   ./setupKubernetesLocal.sh
   ```

   Este script cria um cluster Kubernetes local utilizando k3d, aplica namespaces, instala o Ingress Controller e outros recursos necessários.


## Verificação

Você pode verificar se as aplicações estão em execução usando os seguintes comandos:

```bash
kubectl get pods -n prod
kubectl get services -n prod
```




