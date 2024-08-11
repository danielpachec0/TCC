#!/bin/bash
terraform apply
gcloud container clusters get-credentials spg-cluster --region southamerica-east1-a

kubectl create namespace argocd
kubectl apply -n argocd -f 'https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml'

kubectl apply -f app-grafana.yaml
kubectl apply -f app-k6.yaml
