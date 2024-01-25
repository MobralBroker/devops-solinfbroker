```markdown
# Dockerização da API de Autenticação e PostgreSQL

Este repositório contém os arquivos necessários para dockerizar a API de Autenticação e o PostgreSQL. As imagens foram enviadas para o Docker Hub, permitindo uma fácil implantação e teste local utilizando Kubernetes.

## Docker Hub Repositórios:
- [Imagem API de Autenticação](https://hub.docker.com/repository/docker/jvlr9510/api-autenticacao)
- [Imagem PostgreSQL](https://hub.docker.com/repository/docker/jvlr9510/debeziumpostgres)

## Sobre o Projeto

Este repositório é dividido em dois diretórios principais:

1. **DevOps:**
   - Localizado em [./DevOps](./DevOps)
   - Contém arquivos relacionados à containerização usando Docker e orquestração com Kubernetes.
   - Consulte o [README no diretório DevOps](./DevOps/README.md) para mais detalhes.

2. **Kubernetes:**
   - Localizado em [./Kubernetes](./Kubernetes)
   - Contém manifestos Kubernetes para implantar e gerenciar as aplicações.
   - Consulte a [Documentação do Kubernetes](./Kubernetes/README.md) para mais detalhes.

## Documentação Adicional
- [Documentação do Kubernetes](./Kubernetes/README.md)
- [Documentação do Ngrok](https://ngrok.com/docs)
