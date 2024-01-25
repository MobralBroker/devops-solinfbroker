**README.md:**

# SolinfBroker Docker Compose

Este repositório contém um arquivo Docker Compose para iniciar os serviços necessários para o projeto SolinfBroker. O Docker Compose inclui os seguintes serviços:

- PostgreSQL
- Zookeeper
- Kafka
- Kafdrop
- API de Autenticação
- API CRUD
- Frontend

## Pré-requisitos

Certifique-se de ter o Docker e o Docker Compose instalados no seu sistema. Você pode encontrar informações sobre como instalá-los em [Docker Installation Guide](https://docs.docker.com/get-docker/) e [Docker Compose Installation Guide](https://docs.docker.com/compose/install/).

## Uso

1. Clone este repositório para o seu sistema:

   ```bash
   git clone git@github.com:MobralBroker/devops-solinfbroker.git 
   
   ```

2. Navegue até o diretório clonado:

   ```bash
   cd DevOps
   ```

3. Dê permissão de execução ao script:

   ```bash
   chmod +x solinfbroker_container.sh
   ```

4. Execute o script para iniciar os serviços e a simulação da Matrix:

   ```bash
   ./solinfbroker_container.sh
   ```

   Isso iniciará os serviços definidos no Docker Compose.

5. Para encerrar os serviços e limpar os containers, execute:

   ```bash
   docker compose down
   ```

   Isso encerrará todos os containers iniciados pelo Docker Compose.

**Observação:** Certifique-se de que não há outros serviços utilizando as portas especificadas no Docker Compose para evitar conflitos.

---

