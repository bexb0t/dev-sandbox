# Variables
PROJECT_NAME = dev-sandbox
SERVICE_NAME = dev-sandbox-service
DOCKER_IMAGE = dev-sandbox-image
K8S_NAMESPACE = dev

# Targets
.PHONY: build test package docker-build k8s-deploy k8s-redeploy k8s-delete k8s-port-forward k8s-get k8s-logs clean help

build:
	@echo "Building the project using Maven..."
	mvn clean install

test:
	@echo "Running tests using Maven..."
	mvn test

package:
	@echo "Packaging the project into a JAR file using Maven..."
	mvn package

docker-build: package
	@echo "Building the Docker image..."
	docker build -t $(DOCKER_IMAGE) .

k8s-deploy: docker-build
	@echo "Deploying the application to Kubernetes..."
	kubectl apply -f namespace.yaml
	kubectl apply -f service.yaml
	kubectl apply -f deployment.yaml

k8s-redeploy: docker-build
	@echo "Rebuilding Docker image and redeploying to Kubernetes..."
	kubectl rollout restart deployment/$(PROJECT_NAME) -n $(K8S_NAMESPACE)

k8s-delete:
	@echo "Deleting Kubernetes configurations..."
	kubectl delete -f deployment.yaml
	kubectl delete -f service.yaml
	kubectl delete -f namespace.yaml

k8s-port-forward:
	@echo "Port forwarding to Kubernetes service..."
	kubectl port-forward service/$(SERVICE_NAME) 8080:80 -n $(K8S_NAMESPACE)

k8s-get:
	@echo "Getting all resources in the Kubernetes namespace..."
	kubectl get all -n $(K8S_NAMESPACE)

k8s-logs:
	@echo "Getting logs from the Kubernetes pods..."
	kubectl logs -l app=$(PROJECT_NAME) -n $(K8S_NAMESPACE) --tail=100

clean:
	@echo "Cleaning build artifacts and Docker images..."
	mvn clean
	docker rmi $(DOCKER_IMAGE)

help:
	@echo "Usage:"
	@echo "  make build           - Build the project using Maven"
	@echo "  make test            - Run tests using Maven"
	@echo "  make package         - Package the project using Maven"
	@echo "  make docker-build    - Build the Docker image"
	@echo "  make k8s-deploy      - Deploy the application to Kubernetes"kubectl
	@echo "  make k8s-redeploy    - Rebuild Docker image and redeploy to Kubernetes"
	@echo "  make k8s-delete      - Delete Kubernetes configurations"
	@echo "  make k8s-port-forward - Port forward to Kubernetes service"
	@echo "  make k8s-get         - Get all resources in the Kubernetes namespace"
	@echo "  make k8s-logs        - Get logs from the Kubernetes pods"
	@echo "  make clean           - Clean build artifacts and Docker images"
	@echo "  make help            - Show this help message"
