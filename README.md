
# Dev Sandbox

## Overview

This project is a Java Spring Boot application, packaged as a Docker container and deployed on Kubernetes for local development. It uses Maven for dependency management and builds, and is designed to be run within Docker Desktop's Kubernetes environment.

## Features

- Java Spring Boot application

- Docker-based build and runtime environment

- Kubernetes for local dev

- Maven for build automation

## Prerequisites

- Docker

- Kubernetes

- Maven

- Java JDK 17

- Git

## Setup

### Cloning the Repository


```Copy code
git@github.com:bexb0t/dev-sandbox.git
cd dev-sandbox
```
### Running Locally

To run the app locally, follow these steps:

1. **Build the Docker Image** :

```
Copy code
docker build -t dev-sandbox-image .
```
2. **Deploy to Kubernetes** :

```
Copy code
kubectl apply -f namespace.yaml
kubectl apply -f service.yaml
kubectl apply -f deployment.yaml
```
3. **Port Forwarding** :
   Forward port 8080 from the Kubernetes service to your local machine:
```
Copy code
kubectl port-forward service/dev-sandbox-service 8080:8080
```
4. **Access the Application** :
   Open a browser and go to `http://localhost:8080` to interact with your application.

### Running Locally

You can run the app locally using either the provided Makefile commands or by executing the necessary commands manually.

#### Option 1: Using Makefile Commands

1. **Build the Project** :
```Copy code
make build
```
Compiles and builds the project using Maven.

2. **Build the Docker Image** :
```Copy code
make docker-build
```
Builds the Docker image from the latest project code.

3. **Deploy to Kubernetes** :
```Copy code
make k8s-deploy
```
Applies the Kubernetes configurations to deploy the application.

4. **View Running Pods**:
```Copy Code
make k8s-get
```

5. **Port Forwarding** :
```Copy code
make k8s-port-forward
```
Forwards port 8080 from the Kubernetes service to your local machine.

6. **Access the Application** :Open a browser and go to `http://localhost:8080` to interact with your application.

#### Option 2: Using Command Line

1. **Build the Docker Image** :
```Copy code
docker build -t dev-sandbox .
```
Builds the Docker image manually.

2. **Deploy to Kubernetes** :
```Copy code
kubectl apply -f namespace.yaml
kubectl apply -f service.yaml
kubectl apply -f deployment.yaml
```
Deploys the application to Kubernetes by applying the configuration files.

3. **Vew Running Pods**:
```Copy code
   kubectl get all -n dev
   ```
4. **Port Forwarding** :
```Copy code
kubectl port-forward service/dev-sandbox-service 8080:80
```
Forwards port 8080 from the Kubernetes service to your local machine.

5. **Access the Application** :Open a browser and go to `http://localhost:8080` to interact with your application.

## Development

### Adding New Features

1. **Create a Branch** :
```Copy code
git checkout -b feature/your-feature
```
2. **Develop and Test** :
   Make changes, test locally, and ensure everything works with:
```Copy code
make test
```
3. **Commit and Push** :
```Copy code
git add .
git commit -m "Add new feature"
git push origin feature/your-feature
```
4. **Create a Pull Request**  on GitHub.

### Testing

Run tests locally with:
```Copy code
make test
```
## Troubleshooting

- **Check Docker Logs** : If the container fails to start, check the logs with:
```Copy code
docker logs <container-id>
```
- **Check Kubernetes Logs** : For issues in Kubernetes, check the logs with:
```Copy code
kubectl logs <pod-name>
```

## License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/bexb0t/dev-sandbox/blob/main/LICENSE)  file for details.
