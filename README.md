
## Kubernetes Containerized Run Prerequisites

- Docker

- Kubernetes

### Running Locally in Kubernetes

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

