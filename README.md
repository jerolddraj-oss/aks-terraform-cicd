# AKS Terraform CI/CD Setup

## Steps

1. Login to Azure
2. Set environment variables
3. Run Terraform:
   terraform init
   terraform apply

4. Configure kubectl:
   az aks get-credentials --resource-group aks-rg --name jd-aks-cluster

5. Deploy app:
   kubectl apply -f k8s/

## CI/CD
- Uses GitHub Actions
- Auto deploy on push to main

## Rollback
kubectl rollout undo deployment/nginx-deployment