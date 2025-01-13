Here's a comprehensive list of 10 advanced Dockerfile use cases, along with detailed explanations.

---

# Table of Contents
1. [01_basic_python_app_with_dependencies.Dockerfile](#01_basic_python_app_with_dependenciesdockerfile)
2. [02_multi_stage_build.Dockerfile](#02_multi_stage_builddockerfile)
3. [03_nginx_with_ssl.Dockerfile](#03_nginx_with_ssldockerfile)
4. [04_custom_nodejs_app.Dockerfile](#04_custom_nodejs_appdockerfile)
5. [05_dockerfile_for_java_app.Dockerfile](#05_dockerfile_for_java_appdockerfile)
6. [06_using_docker_entrypoint.Dockerfile](#06_using_docker_entrypointdockerfile)
7. [07_build_and_run_tests_in_docker.Dockerfile](#07_build_and_run_tests_in_dockerdockerfile)
8. [08_dockerfile_with_caching.Dockerfile](#08_dockerfile_with_cachingdockerfile)
9. [09_dockerfile_for_gpu_apps.Dockerfile](#09_dockerfile_for_gpu_appsdockerfile)
10. [10_dockerfile_for_microservices.Dockerfile](#10_dockerfile_for_microservicesdockerfile)

---

## 1. `01_basic_python_app_with_dependencies.Dockerfile`

This Dockerfile demonstrates how to create a basic Python application that installs necessary dependencies.

### Content:
```dockerfile
# Use the official Python image as the base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY . .

# Expose the port the app will run on
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]
```

### Explanation:
- The `FROM` directive specifies the base image (Python).
- The `COPY` commands copy files from the host into the container.
- The `RUN` command installs the Python dependencies from `requirements.txt`.
- `CMD` runs the Python application.

---

## 2. `02_multi_stage_build.Dockerfile`

This Dockerfile demonstrates how to use multi-stage builds to reduce the size of the final image.

### Content:
```dockerfile
# Build stage
FROM node:14 AS build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Production stage
FROM nginx:alpine

# Copy built files from the build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80
```

### Explanation:
- The first stage builds the Node.js application.
- The second stage uses a lightweight `nginx` image and copies the build artifacts from the first stage.

---

## 3. `03_nginx_with_ssl.Dockerfile`

This Dockerfile sets up an NGINX server with SSL.

### Content:
```dockerfile
FROM nginx:latest

# Copy the SSL certificate and key into the container
COPY server.crt /etc/ssl/certs/
COPY server.key /etc/ssl/private/

# Configure NGINX to use SSL
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS
EXPOSE 443
```

### Explanation:
- This Dockerfile sets up NGINX with SSL by copying the certificate and key files into the container.
- The `nginx.conf` file must be configured to use SSL.

---

## 4. `04_custom_nodejs_app.Dockerfile`

This Dockerfile builds a custom Node.js application.

### Content:
```dockerfile
# Use the official Node.js image as base
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
```

### Explanation:
- This Dockerfile installs Node.js dependencies and starts the application with the `npm start` command.

---

## 5. `05_dockerfile_for_java_app.Dockerfile`

This Dockerfile is for a Java application using Maven.

### Content:
```dockerfile
# Use an official Maven image to build the project
FROM maven:3.6.3-jdk-8 AS build

WORKDIR /app
COPY . .
RUN mvn clean package

# Use OpenJDK image to run the application
FROM openjdk:8-jre-alpine

COPY --from=build /app/target/myapp.jar /usr/local/lib/myapp.jar

CMD ["java", "-jar", "/usr/local/lib/myapp.jar"]
```

### Explanation:
- The first stage builds the Java application with Maven.
- The second stage runs the application using OpenJDK.

---

## 6. `06_using_docker_entrypoint.Dockerfile`

This Dockerfile demonstrates how to use `ENTRYPOINT` for custom behavior when starting a container.

### Content:
```dockerfile
FROM ubuntu:latest

# Set the default environment variable
ENV APP_HOME=/app

# Set working directory
WORKDIR $APP_HOME

# Copy the app files
COPY . .

# Make entrypoint executable
ENTRYPOINT ["./start.sh"]
```

### Explanation:
- The `ENTRYPOINT` defines the default command that will always be executed when the container starts.
- This approach allows users to override the command if needed.

---

## 7. `07_build_and_run_tests_in_docker.Dockerfile`

This Dockerfile builds an image and runs tests for a Node.js app.

### Content:
```dockerfile
FROM node:14

WORKDIR /app
COPY package*.json ./
RUN npm install

# Run tests
COPY . .
RUN npm run test

# Expose port
EXPOSE 3000
```

### Explanation:
- This Dockerfile installs dependencies and runs the tests during the build process.

---

## 8. `08_dockerfile_with_caching.Dockerfile`

This Dockerfile demonstrates effective caching strategies for optimizing build times.

### Content:
```dockerfile
FROM node:16

WORKDIR /app

# Copy only package.json first to leverage Docker cache
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the app files
COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

### Explanation:
- By copying only `package.json` and `package-lock.json` first, Docker will cache the installation of dependencies unless these files change, which speeds up future builds.

---

## 9. `09_dockerfile_for_gpu_apps.Dockerfile`

This Dockerfile sets up a container to use GPU resources with Docker.

### Content:
```dockerfile
FROM nvidia/cuda:11.2-base

WORKDIR /app

# Install dependencies for the GPU application
RUN apt-get update && apt-get install -y \
    python3-pip && \
    pip3 install tensorflow-gpu

COPY . .

CMD ["python3", "gpu_app.py"]
```

### Explanation:
- This Dockerfile uses an NVIDIA base image with CUDA support, which is necessary for GPU-accelerated applications.
- The container installs TensorFlow with GPU support.

---

## 10. `10_dockerfile_for_microservices.Dockerfile`

This Dockerfile demonstrates setting up a microservice architecture.

### Content:
```dockerfile
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the microservice jar file
COPY target/microservice.jar /app/microservice.jar

EXPOSE 8080

CMD ["java", "-jar", "microservice.jar"]
```

### Explanation:
- The microservice is packaged as a JAR file.
- The container runs the JAR file as a Java application.

---