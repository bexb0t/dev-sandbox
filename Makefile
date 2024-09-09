# Variables
PROJECT_NAME = dev-sandbox
JAR_FILE = target/$(PROJECT_NAME)-0.0.1-SNAPSHOT.jar

# Targets
.PHONY: build test package run clean help

build:
	@echo "Building the project using Maven..."
	mvn clean install

test:
	@echo "Running tests using Maven..."
	mvn test

package:
	@echo "Packaging the project into a JAR file using Maven..."
	mvn package

run: package
	@echo "Running the application locally..."
	java -jar $(JAR_FILE)

clean:
	@echo "Cleaning build artifacts..."
	mvn clean

help:
	@echo "Usage:"
	@echo "  make build   - Build the project using Maven"
	@echo "  make test    - Run tests using Maven"
	@echo "  make package - Package the project into a JAR file"
	@echo "  make run     - Run the application locally"
	@echo "  make clean   - Clean build artifacts"
	@echo "  make help    - Show this help message"
