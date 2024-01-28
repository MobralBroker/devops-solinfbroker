# Instalação do k3d - Guia Rápido

Este guia fornece instruções passo a passo para instalar o k3d e criar um cluster Kubernetes local utilizando o k3d.

## Pré-requisitos

Certifique-se de ter o Docker instalado em seu sistema antes de prosseguir. Você pode baixar o Docker em [Docker Hub](https://hub.docker.com/).

## Instalação do k3d

1. Abra um terminal.

2. Execute o seguinte comando para instalar o k3d usando o script de instalação automática:

   ```bash
   curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
   ```

   Este comando baixará e executará o script de instalação.

3. Após a conclusão, verifique se o k3d foi instalado corretamente:

   ```bash
   k3d --version
   ```

   Isso deve exibir a versão do k3d.

## Criação de um Cluster Kubernetes com k3d

1. Execute o seguinte comando para criar um cluster Kubernetes local chamado "meu-cluster" com 2 agentes:

   ```bash
   k3d cluster create meu-cluster --api-port 6550 -p "8081:80@loadbalancer" --agents 2
   ```

   - `--api-port 6550`: Define a porta para a API do Kubernetes.
   - `-p "8081:80@loadbalancer"`: Realiza o bind da porta 8081 no host para a porta 80 no load balancer do cluster.
   - `--agents 2`: Especifica o número de nós agentes no cluster.

2. Após a criação bem-sucedida, você pode verificar o cluster com o seguinte comando:

   ```bash
   kubectl cluster-info --context k3d-meu-cluster
   ```

   Certifique-se de substituir "meu-cluster" pelo nome do seu cluster, se for diferente.

3. Agora, você está pronto para usar seu cluster Kubernetes local.

## Acesso às Aplicações Expostas

As aplicações expostas no cluster podem ser acessadas através do localhost na porta especificada. No exemplo acima, qualquer aplicação exposta no cluster na porta 80 estará acessível no localhost:8081 do host local.

Por exemplo, se você implantar uma aplicação usando um serviço NodePort na porta 80, você poderá acessá-la em http://localhost:8081.

Lembre-se de ajustar a porta de acordo com a especificada durante a criação do cluster.
