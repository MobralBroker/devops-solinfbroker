# Instalando Nginx Ingress

Neste guia, vamos instalar o Nginx Ingress utilizando o chart oficial do Helm. Também criaremos um novo Namespace, utilizando o arquivo `namespaces.yml` para manter a infraestrutura como código atualizada.

```bash
# Adicionar o repositório do Ingress Nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# Atualizar os repositórios Helm
helm repo update

# Instalar o Ingress Nginx no Namespace 'ingress-nginx'
helm install ingress-nginx --namespace ingress-nginx --set rbac.create=true --set controller.kind=DaemonSet --set controller.service.type=ClusterIP --set controller.hostNetwork=true ingress-nginx/ingress-nginx
```

Na saída da instalação do Ingress Nginx pelo comando Helm, recebemos um exemplo de como utilizar o recurso Ingress. Vamos usar esse exemplo para expor um dos nossos serviços para teste.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example
  namespace: foo
spec:
  ingressClassName: nginx
  rules:
    - host: www.example.com
      http:
        paths:
          - pathType: Prefix
            backend:
              service:
                name: exampleService
                port:
                  number: 80
            path: /
```

Este trecho de código representa um recurso Ingress para expor o serviço `exampleService` no Namespace `foo` sob o domínio `www.example.com`. Ajuste conforme necessário para o seu ambiente.

Lembre-se de adaptar os valores de `host`, `service.name`, `service.port.number` e outros conforme a configuração do seu projeto. Este é um exemplo básico, e você pode personalizar conforme as necessidades do seu aplicativo.
