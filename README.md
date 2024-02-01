# Manifestos Kubernetes - README

Este repositório utiliza manifestos Kubernetes para gerenciar recursos como Deployments, Services, Ingress, ConfigMaps e Secrets.

## Tecnologias Adotadas

### Deployment

- **Descrição:** O Deployment é uma abstração no Kubernetes que gerencia a criação e a atualização de pods em um cluster.
- **Uso:** Os manifestos do Deployment são usados para definir as características de implantação de um aplicativo ou microserviço.

### Service

- **Descrição:** O Service permite a exposição de pods como serviços de rede dentro ou fora do cluster Kubernetes.
- **Uso:** Os manifestos do Service são utilizados para criar serviços e especificar as regras de acesso aos pods.

### Ingress

- **Descrição:** O Ingress é um recurso Kubernetes que gerencia o acesso externo aos serviços dentro do cluster.
- **Uso:** Os manifestos do Ingress são empregados para definir regras de roteamento e configurações de TLS para permitir o acesso externo aos serviços.

### ConfigMap

- **Descrição:** O ConfigMap é uma maneira de armazenar configurações não confidenciais em pares de chave-valor.
- **Uso:** Os manifestos do ConfigMap são utilizados para injetar configurações ou variáveis de ambiente nos pods de um Deployment.

### Secret

- **Descrição:** O Secret é utilizado para armazenar informações sensíveis, como senhas ou chaves de API, de forma segura no Kubernetes.
- **Uso:** Os manifestos do Secret são empregados para gerenciar e injetar informações confidenciais nos pods, garantindo a segurança dos dados.



