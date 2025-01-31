#!/bin/bash

# Start Minikube
minikube start

# Install Jenkins
helm repo add jenkins https://charts.jenkins.io
helm repo update
helm install jenkins jenkins/jenkins

# Deploy Node.js App
kubectl apply -f k8s/blue-deployment.yaml
kubectl apply -f k8s/green-deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Setup Complete"

