#!/bin/bash

set -e

echo "Starting Minikube..."
minikube start

echo "Setting Minikube context..."
kubectl config use-context minikube

echo "Building Docker image..."
docker build -t django-app:local .

echo "Loading Docker image into Minikube..."
minikube image load django-app:local

echo "Applying Kubernetes configuration..."
kubectl apply -f k8s/

echo "Waiting for all pods to be ready..."

READY=false
TIMEOUT=300
INTERVAL=5
ELAPSED=0

while [ "$READY" = "false" ] && [ "$ELAPSED" -lt "$TIMEOUT" ]; do
    NOT_READY=$(kubectl get pods --no-headers | grep -v 'Running' | grep -v 'Completed' | wc -l)
    if [ "$NOT_READY" -eq 0 ]; then
        READY=true
        echo "All pods are ready!"
    else
        echo "Waiting for pods... ($NOT_READY pods not ready)"
        sleep "$INTERVAL"
        ELAPSED=$((ELAPSED + INTERVAL))
    fi
done

if [ "$READY" = "false" ]; then
    echo "Timeout reached. Some pods are still not ready. Check their status with 'kubectl get pods'."
    exit 1
fi

echo "Access Django app at: http://$(minikube ip):$(kubectl get service django-service -o jsonpath='{.spec.ports[0].nodePort}')/"
