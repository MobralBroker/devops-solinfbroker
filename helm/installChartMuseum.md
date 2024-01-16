# Gataria via ChartMuseum

A seguir, está um guia passo a passo para instalar a Gataria usando o ChartMuseum como repositório Helm.

## Instalando o ChartMuseum

Antes de começar, vamos instalar o ChartMuseum usando o Helm.

```bash
# Adicione o repositório ChartMuseum
helm repo add chartmuseum https://chartmuseum.github.io/charts

# Atualize os repositórios Helm
helm repo update

# Instale o ChartMuseum
helm install chartmuseum chartmuseum/chartmuseum -n github-actions --set service.type=NodePort --set service.nodePort=32200 --set env.open.DISABLE_API=false
```

## Configurando o repositório Helm para a Gataria

Agora, adicionaremos o ChartMuseum como um repositório Helm e prepararemos o ambiente para empurrar nossos charts.

```bash
# Instale o plugin Helm Push para trabalhar com ChartMuseum
helm plugin install https://github.com/chartmuseum/helm-push

# Adicione o ChartMuseum como repositório Helm
helm repo add gataria-charts http://127.0.0.1:32200
```

## Efetuando push dos charts para o ChartMuseum

Certifique-se de que você já tenha os charts da Gataria prontos. Se não tiver, gere os charts e, em seguida, efetue o push.

```bash
# Entre no diretório do chart da Gataria
cd path/to/gataria-chart

# Efetue o push do chart para o ChartMuseum
helm push . gataria-charts
```

Agora, os charts da Gataria estão disponíveis no ChartMuseum. Você pode implantar a Gataria a partir desse repositório usando Helm.

Esse guia assume que você já configurou adequadamente os charts da Gataria. Certifique-se de ajustar os caminhos e configurações conforme necessário.

Lembre-se de que o ChartMuseum está configurado para ser acessado localmente neste exemplo (http://127.0.0.1:32200). Se você estiver implantando em um ambiente diferente, ajuste o endereço do repositório conforme necessário.

