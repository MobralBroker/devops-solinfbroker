# HPA (Horizontal Pod Autoscaler)

O HPA (Horizontal Pod Autoscaler) é um recurso muito aguardado no Kubernetes, permitindo a escalabilidade automática das aplicações. Vamos configurar o HPA para um dos nossos microsserviços, mas antes, precisamos do Metrics Server.

```bash
# Adicionar o repositório do Metrics Server
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/

# Atualizar os repositórios Helm
helm repo update

# Instalar o Metrics Server no Namespace 'kube-system'
helm install --namespace kube-system metrics-server metrics-server/metrics-server --set 'args={--kubelet-insecure-tls}'
```

Nossos pods precisam ter limites de CPU e RAM configurados para que o HPA funcione corretamente.

Adicione as seguintes configurações ao arquivo de definição do seu pod (por exemplo, no arquivo `values.yaml` do seu chart Helm) sob a chave `resources`:

```yaml
resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi
```

***Teste de estress***
```bash
# Iniciar um gerador de carga para testar o autoescalamento
kubectl run -i --tty load-generator --image=busybox /bin/sh -n dev

# Executar o seguinte comando no shell interativo do load-generator
while true; do wget -q -O- http://gataria-backend-catalog/catalog/healthcheck; done
```

