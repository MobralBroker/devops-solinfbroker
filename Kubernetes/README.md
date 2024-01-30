# README: Aplicação de Manifestos Kubernetes para o Projeto


## Estrutura do Projeto

O projeto é organizado da seguinte forma:

```
projeto/
|-- namespace.yaml
|-- configMap.yaml
|-- secret.yaml
|-- secrets.yaml
|-- ingress.yaml
|-- postgresql/
|   |-- deployment.yaml
|   |-- service.yaml
|   |-- persistentVolume.yaml
|   |-- persistentVolumeClaim.yaml
|-- api-auth/
|   |-- deployment.yaml
|   |-- service.yaml
|-- api-crud/
|   |-- deployment.yaml
|   |-- service.yaml
|-- api-processamento-ordens/
|   |-- deployment.yaml
|   |-- service.yaml
|-- frontend/
|   |-- deployment.yaml
|   |-- service.yaml
|   |-- ingress.yaml
|-- zookeper/
|   |-- deployment.yaml
|   |-- service.yaml
|-- kafka/
|   |-- deployment.yaml
|   |-- service.yaml
|-- kconnect/
|   |-- deployment.yaml
|   |-- service.yaml
...
```

### Passo 1: Aplicar Namespaces

Certifique-se de que você está na raiz do projeto. Aplique o namespace para cada ambiente (dev e prod):

```bash
kubectl apply -f namespace.yaml
```

### Passo 2: Aplicar ConfigMaps

Aplique os ConfigMaps correspondentes a cada ambiente (dev ou prod). Certifique-se de configurar corretamente as variáveis em `configmaps/dev-configmap.yaml` e `configmaps/prod-configmap.yaml`:
* Aplicando para o namespace dev
```bash
kubectl apply -f configMap.yaml -n dev
```
* Aplicando para o namespace prod
```bash
kubectl apply -f configMap.yaml -n prod
```

### Passo 3: Aplicar Secrets

Aplique os Secrets correspondentes a cada ambiente (dev ou prod). Certifique-se de configurar corretamente os dados sensíveis em `secrets/dev-secret.yaml` e `secrets/prod-secret.yaml`:
* Aplicando para o namespace dev
```bash
kubectl apply -f secret.yaml -n dev
```
* Aplicando para o namespace prod
```bash
kubectl apply -f secret.yaml -n prod
```

### Passo 4: Aplicar Manifestos para Microserviços

Acesse cada diretório de microserviço e aplique os manifestos específicos (deployment e service) no namespace correspondente (dev ou prod). Exemplo para o primeiro microserviço:
* Aplicando para o namespace dev:
```bash
cd api-auth
kubectl apply -f . -n dev
cd ..
```
* Aplicando para o namespace prod:
```bash
cd api-auth
kubectl apply -f . -n prod
cd ..
```

Repita este passo para cada microserviço.

### Observações

- **Alteração do DNS:**
  Se aplicado no namespace `prod`, é necessário ajustar o DNS das aplicações em `configMap.yaml`. Atualize todos os apontamentos de `.prod.svc.cluster.local` conforme necessário.

