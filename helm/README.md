# Guia de Implantação

Este guia fornecerá instruções sobre como implantar os containers da API de Autenticação e PostgreSQL-Debezium em um cluster Kubernetes usando os comandos `kubectl` e Helm.

## Pré-requisitos

- Certifique-se de ter o `kubectl` instalado e configurado para acessar seu cluster Kubernetes.
- Helm deve estar instalado em seu ambiente.

## Passos de Implantação

1. **Aplicar Namespaces:**

    ```bash
    kubectl apply -f namespaces.yml
    ```

2. **ConfigMap e Secrets:**

    ```bash
    kubectl apply -f configMap.yml -n dev
    kubectl apply -f secrets.yml -n dev
    ```

3. **Instalar API de Autenticação com Helm:**

    ```bash
    cd api-autenticacao
    helm install api-autenticacao . -n dev
    ```

4. **Instalar PostgreSQL-Debezium com Helm:**

    ```bash
    cd database-postgresql-debezium
    helm install database-postgresql-debezium . -n dev
    ```

5. **Aviso Importante:**

    Antes de executar os comandos Helm, leia os arquivos `values.yaml`, `deployment.yaml` e outros arquivos de instalação localizados nos diretórios `api-autenticacao` e `database-postgresql-debezium`. Eles podem conter configurações específicas que você pode querer ajustar.

## Observações Adicionais

- Certifique-se de que todos os pods e serviços estão em execução usando os comandos `kubectl get pods -n dev` e `kubectl get services -n dev`.
- Caso encontre problemas ou precise de mais informações, consulte os arquivos `charts` e a documentação Helm.


