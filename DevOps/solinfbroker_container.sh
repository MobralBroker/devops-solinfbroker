#!/usr/bin/env bash

# Função para imprimir mensagens em vermelho
print_red() {
    echo -e "\033[0;31m$1\033[0m"
}

# Simulação da Matrix com letras, números e palavras
print_red "

    #####  #####  #      #  ##   #  #####  #####  #####  #####  #  #  #####  #####
    #      #   #  #      #  ##   #  #      #   #  #   #  #   #  # #   #      #   #
    #####  #   #  #      #  # #  #  ###    #####  #####  #   #  ##    ###    #####
        #  #   #  #      #  #  ###  #      #   #  #  #   #   #  # #   #      #  #
    #####  #####  #####  #  #   ##  #      #####  #   #  #####  #  #  #####  #   #


"

# Conteudo do arquivo docker-compose.yml
cat <<EOF > docker-compose.yaml
version: '3.7'

services:
  postgresql:
    image: jvlr9510/debeziumpostgres:dev
    container_name: postgresql
    ports:
      - "5432:5432"
    hostname: postgresql
    environment:
      POSTGRES_DB: "database_master"
      POSTGRES_USER: "root"
      POSTGRES_PASSWORD: "admin"
      POSTGRES_HOST_AUTH_METHOD: "scram-sha-256"
    volumes:
      - ./volume:/var/lib/postgresql/data
      - ./initsql:/docker-entrypoint-initdb.d
    command: ["postgres", "-c", "wal_level=logical"]
    networks:
      - broker-kafka

  zookeeper:
    image: confluentinc/cp-zookeeper:latest
    hostname: zookeeper
    container_name: zookeeper
    ports:
      - "2181:2181"
      - "2888:2888"
      - "3888:3888"
    networks:
      - broker-kafka
    environment:
      ZOOKEEPER_CLIENT_PORT: 2181
      ZOOKEEPER_TICK_TIME: 2000

  kafka:
    image: confluentinc/cp-kafka:latest
    hostname: kafka
    container_name: kafka
    restart: "no"
    networks:
      - broker-kafka
    depends_on:
      - zookeeper
    ports:
      - "9092:9092"
    environment:
      KAFKA_BROKER_ID: 1
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_LISTENERS: PLAINTEXT://:29092,PLAINTEXT_HOST://:9092
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka:29092,PLAINTEXT_HOST://localhost:9092
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
      KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1

  kafdrop:
    image: obsidiandynamics/kafdrop:latest
    restart: "no"
    hostname: kafkdrop
    container_name: kafkdrop
    networks:
      - broker-kafka
    depends_on:
      - kafka
    ports:
      - "9000:9000"
    environment:
      KAFKA_BROKERCONNECT: PLAINTEXT://kafka:29092,PLAINTEXT_HOST://localhost:9092

  api-autenticacao:
    image: solinfbroker/api-autenticacao:dev
    ports:
      - "8080:8080"
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://postgresql:5432/database_master
      SPRING_DATASOURCE_USERNAME: root
      SPRING_DATASOURCE_PASSWORD: admin
      SPRING_FLYWAY_BASELINEONMIGRATE: true
      SPRING_FLYWAY_TABLE: schema_version_api_autenticacao
      SPRING_JPA_HIBERNATE_DDL-AULA: validate
      SPRING_JPA_PROPERTIES_HIBERNATE_JDBC_LOB_NON_CONTEXTUAL_CREATION: true
      API_SECURITY_TOKEN_SECRET: teste
      SERVER_PORT: 8080
    networks:
      - broker-kafka
    depends_on:
      - postgresql

  api-crud:
    image: solinfbroker/api-crud:dev
    ports:
      - "8081:8081"
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://postgresql:5432/database_master
      SPRING_DATASOURCE_USERNAME: root
      SPRING_DATASOURCE_PASSWORD: admin
      SPRING_FLYWAY_BASELINEONMIGRATE: true
      SPRING_FLYWAY_TABLE: schema_version_api_geral
      SPRING_JPA_HIBERNATE_DDL-AULA: validate
      SPRING_JPA_PROPERTIES_HIBERNATE_JDBC_LOB_NON_CONTEXTUAL_CREATION: true
      API_SECURITY_TOKEN_SECRET: teste
      SERVER_PORT: 8081
      API_AUTENTICACAO_PATH: http://api-autenticacao:8080
      SPRING_KAFKA_BOOTSTRAP_SERVERS: kafka:29092
    networks:
      - broker-kafka
    depends_on:
      - api-autenticacao
      - kafka
      - postgresql

  frontend:
    image: solinfbroker/frontend:dev
    ports:
      - "3000:3000"
    environment:
      vue_app_auth_api_url: "http://api-autenticacao:8080"
      vue_app_crud_api_url: "http://api-crud:8081"
    volumes:
      - /app/node_modules
      - $(pwd):/app
    networks:
      - broker-kafka
    depends_on:
      - api-autenticacao
      - postgresql
      - api-crud

networks:
  broker-kafka:
    name: broker-kafka
    driver: bridge
EOF

# Executa a simulação da Matrix enquanto inicializa os serviços
(print_red "Inicializando serviços Kafka e banco de dados!"; simulate_matrix) &

# Inicializa docker compose
docker compose up -d

