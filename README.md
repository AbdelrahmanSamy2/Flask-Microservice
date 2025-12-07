# Flask-Microservice

## Docker
```
docker build -t abdelrahmansamy97/flask-microservice:latest .
docker push abdelrahmansamy97/flask-microservice:latest
```
## Terraform-AKS
### Azure CLI
```
az login
az ad sp create-for-rbac --name "terraform-sp" --role "Contributor" --scopes "/subscriptions/<Subscription_ID>"
export ARM_CLIENT_ID="<app_id>"
export ARM_CLIENT_SECRET="<password>"
export ARM_TENANT_ID="<tenant_id>"
export ARM_SUBSCRIPTION_ID="<Subscription_ID>"
```
### Terraform
```
terraform init
terraform plan
terraform apply
```
## Kubernetes
### Kubectl Config
```
az aks get-credentials --resource-group flask-resource-group --name flask-aks-cluster
```
### Namespace Creation
```
kubectl apply -f flask-namespace.yaml
```
### Microservice Deployment
```
kubectl create namespace flask-app
kubectl apply -f flask-deployment.yaml
kubectl get pods -n flask-app
```
### Exposing to the Internet
```
kubectl apply -f flask-service.yaml
kubectl get svc -n flask-app
```
