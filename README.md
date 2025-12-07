# Flask Microservice on Azure Kubernetes Service (AKS)

This project demonstrates deploying a Python Flask microservice on Kubernetes using Docker, Terraform, GitHub Actions, and Azure Monitor.

---

## Project Structure
```
.
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── routes/
│   │   ├── user_routes.py
│   │   └── product_routes.py
│   └── services/
│       ├── user_service.py
│       └── product_service.py
│
├── run.py
├── requirements.txt
├── Dockerfile
│
├── k8s/
│   ├── flask-namespace.yaml
│   ├── flask-deployment.yaml
│   └── flask-service.yaml
│
├── terraform-aks/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── outputs.tf
│   ├── providers.tf
│   └── terraform.tfstate*
│
└── README.md
```

## 1. Clone the repo
https://github.com/AbdelrahmanSamy2/Flask-Microservice

## 2. Dockerization

- Build and push the Docker image:
```
docker build -t abdelrahmansamy97/flask-microservice:latest .
docker push abdelrahmansamy97/flask-microservice:latest
```
## 3. Provisioning Kubernetes Cluster (AKS using Terraform)
- Configure Azure CLI
```
az login
az ad sp create-for-rbac --name "terraform-sp" --role "Contributor" --scopes "/subscriptions/<Subscription_ID>"
export ARM_CLIENT_ID="<app_id>"
export ARM_CLIENT_SECRET="<password>"
export ARM_TENANT_ID="<tenant_id>"
export ARM_SUBSCRIPTION_ID="<Subscription_ID>"
```
- Run Terraform
```
cd terraform-aks
terraform init
terraform plan
terraform apply
```
## 4. Microservice Deployment on Kubernetes
- Kubectl Config
```
az aks get-credentials --resource-group flask-resource-group --name flask-aks-cluster
```
- Namespace Creation
```
kubectl apply -f k8s/flask-namespace.yaml
```
- Microservice Deployment
```
kubectl apply -f k8s/flask-deployment.yaml
kubectl get pods -n flask-app
```
## 5. Exposing the Microservice to the Internet
- The service is exposed via a LoadBalancer
```
kubectl apply -f k8s/flask-service.yaml
kubectl get svc -n flask-app
```
- Open in Browser: http://57.153.22.15/users

<img width="408" height="97" alt="image" src="https://github.com/user-attachments/assets/6394f35c-97c0-443c-b2f2-74a6fa0d2dd7" />


## 6. Implementation of CI/CD with GitHub Actions
- The workflow automates: Building Docker image, Pushing to DockerHub, and Deploying to AKS.
- Triggered on push to main.
- Workflow file: .github/workflows/ci-cd.yml
- Workflow performs:
```
1) Checkout source
2) Build Docker image
3) Push to DockerHub
4) Authenticate to Azure
5) Apply Kubernetes manifests
6) Restart rollout
```

## 7. Monitoring
- Enable Managed Prometheus Metrics
```
SUBSCRIPTION_ID=$(az account show --query id -o tsv)
az account set --subscription "$SUBSCRIPTION_ID"

az aks update \
  --resource-group flask-resource-group \
  --name flask-aks-cluster \
  --enable-azure-monitor-metrics
```

- Verify metrics:

<img width="597" height="58" alt="image" src="https://github.com/user-attachments/assets/8aee2504-248c-4ca2-ac4b-d5cab36a3770" />
<img width="472" height="76" alt="image" src="https://github.com/user-attachments/assets/aa05e4e4-9a38-4aa4-b082-5018a2f77c60" />


- Grafana Dashboards
```
Azure Managed Grafana is automatically integrated with Azure Monitor under:
AKS → Monitoring → Dashboards with Grafana (preview)
```

<img width="1615" height="677" alt="image" src="https://github.com/user-attachments/assets/ac4b3eb5-ca9a-4ced-8b3e-b962d84a79ba" />

