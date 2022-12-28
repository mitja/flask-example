# Minimal Flask Example Application

This is a minimal flask example application with a Dockerfile and a Kubernetes deployment manifest. It is meant to demonstrate building and deploying an app to a container runtime or Kubernetes cluster.

## How to use with Minikube

1. Start minikube: ```minikube start -p flask-example```
2. Build image: ```minikube -p flask-example image build -t flask-example .```
3. Deploy the image. Note: **imagePullPolicy: Never** is necessary to run on minikube without pushing the image to a container registry: ```minikube -p flask-example kubectl -- apply -f deployment.yml```
4. Expose the service and check that its running: ```minikube -p flask-example service flask-example-service --url```
5. Start a shell container to check from within the cluster: ```minikube -p flask-example kubectl -- run my-shell --rm -i --tty --image curlimages/curl -- sh```
6. Then in the pod shell, use curl to test the service: ```curl flask-example-service:5000````
7. Exit the shell and delete the shell pod: ```exit```
8. Delete the cluster: ```minikube delete -p flask-example```
```

