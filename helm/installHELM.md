# Instalação HELM

**https://helm.sh/docs/intro/install/#from-apt-debianubuntu** <- Documentação.

```bash
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
```
```bash
sudo apt-get install apt-transport-https --yes
```
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
```
```bash
sudo apt-get update && sudo apt-get install -y helm
```
