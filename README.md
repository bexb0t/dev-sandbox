# Dev Sandbox

## Overview

A Java Spring Boot 3.2.9 application built with Maven. Uses Java 17. 

## Prerequisites

Before setting up the project locally, make sure you have [JDK 17] (https://www.oracle.com/java/technologies/downloads/#java17).

## Setup

### Cloning the Repository

To start working on the project, clone the repository to your local machine:
```Copy code
git clone git@github.com:bexb0t/dev-sandbox.git
cd dev-sandbox
```

### Running Locally

You can run the application locally using Maven. Follow these steps:

1. **Build the Project** :

```Copy code
make build
```

This command will compile the source code, run any tests, and package the application into a JAR file.

2. **Run the Application** :
Run: 
```Copy code
java -jar target/dev-sandbox-0.0.1-SNAPSHOT.jar
```
This will start the Spring Boot application. By default, it will be accessible at `http://localhost:8080`.

### Testing
To run tests you can run make with the target `test`:
```Copy code
make test
```

- **Verify Maven Dependencies** : Ensure all dependencies are resolved correctly by running:

```Copy code
mvn dependency:resolve
```
## License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/bexb0t/dev-sandbox/blob/main/LICENSE)  file for details.