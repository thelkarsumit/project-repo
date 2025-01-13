Here's a collection of 10 basic Dockerfile use cases to help you get started with Dockerfile writing.

## Table of Contents

1. [01_basic_python_application.Dockerfile](#01_basic-python-applicationdockerfile)  
2. [02_python_application_with_requirements.Dockerfile](#02-python-application-with-requirementsdockerfile)  
3. [03_simple_web_server_using_nginx.Dockerfile](#03-simple-web-server-using-nginxdockerfile)  
4. [04_dockerfile_with_multi-stage_build.Dockerfile](#04-dockerfile-with-multi-stage-builddockerfile)  
5. [05_ruby_application.Dockerfile](#05-ruby-applicationdockerfile)  
6. [06_dockerfile_with_custom_entrypoint.Dockerfile](#06-dockerfile-with-custom-entrypointdockerfile)  
7. [07_dockerfile_for_java_application.Dockerfile](#07-dockerfile-for-java-applicationdockerfile)  
8. [08_dockerfile_with_environment_variables.Dockerfile](#08-dockerfile-with-environment-variablesdockerfile)  
9. [09_dockerfile_for_nodejs_application.Dockerfile](#09-dockerfile-for-nodejs-applicationdockerfile)  
10. [10_dockerfile_with_docker-compose.Dockerfile](#10-dockerfile-with-docker-composedockerfile)

---

### 1. [01_basic_python_application.Dockerfile](#01_basic-python-applicationdockerfile)

**Use Case: Dockerfile for a basic Python application**

```dockerfile
# Use Python official image from Docker Hub
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files to the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
```

**Explanation:**
- This Dockerfile uses the official Python image to create a container for a basic Python app.
- The working directory is set to `/app`, and the files are copied into this directory.
- Dependencies are installed using `pip` from a `requirements.txt` file.
- The application runs on port 5000, which is exposed.

---

### 2. [02_python_application_with_requirements.Dockerfile](#02-python-application-with-requirementsdockerfile)

**Use Case: Dockerfile for Python application with dependencies**

```dockerfile
# Use Python official image
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy requirements.txt to install dependencies first
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app

# Expose the application port
EXPOSE 8080

# Command to run the app
CMD ["python", "server.py"]
```

**Explanation:**
- This Dockerfile installs dependencies first by copying only `requirements.txt` and installing them before copying the rest of the application code.
- This optimizes the Dockerfile by leveraging Docker's layer caching mechanism.

---

### 3. [03_simple_web_server_using_nginx.Dockerfile](#03-simple-web-server-using-nginxdockerfile)

**Use Case: Dockerfile for a simple Nginx web server**

```dockerfile
# Use official Nginx image
FROM nginx:alpine

# Copy the website content to the Nginx directory
COPY ./html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
```

**Explanation:**
- This Dockerfile uses Nginx to serve static HTML content.
- The static files from the `html` directory are copied into the container's Nginx directory.
- The server runs on port 80.

---

### 4. [04_dockerfile_with_multi-stage_build.Dockerfile](#04-dockerfile-with-multi-stage-builddockerfile)

**Use Case: Dockerfile with multi-stage builds for optimized image size**

```dockerfile
# Stage 1: Build stage
FROM node:14 AS build

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production stage
FROM nginx:alpine

# Copy the build output from the build stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run Nginx server
CMD ["nginx", "-g", "daemon off;"]
```

**Explanation:**
- This Dockerfile demonstrates a multi-stage build where the first stage builds the app, and the second stage copies the build output into a lighter Nginx container.
- This results in a smaller final image by excluding unnecessary build dependencies.

---

### 5. [05_ruby_application.Dockerfile](#05-ruby-applicationdockerfile)

**Use Case: Dockerfile for a Ruby application**

```dockerfile
# Use official Ruby image
FROM ruby:2.7

# Install required system dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /app

# Copy Gemfile and install gems
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Copy the application code
COPY . /app

# Expose port 3000
EXPOSE 3000

# Run the Ruby on Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
```

**Explanation:**
- This Dockerfile sets up a Ruby on Rails application by installing necessary system dependencies, including Node.js and PostgreSQL client.
- It then installs Ruby gems and runs the Rails server.

---

### 6. [06_dockerfile_with_custom_entrypoint.Dockerfile](#06-dockerfile-with-custom-entrypointdockerfile)

**Use Case: Dockerfile with a custom entrypoint**

```dockerfile
# Use official Ubuntu image
FROM ubuntu:20.04

# Install necessary tools
RUN apt-get update && apt-get install -y curl

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# Define the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
```

**Explanation:**
- This Dockerfile demonstrates how to specify a custom entrypoint using an `ENTRYPOINT` instruction.
- The `entrypoint.sh` script is executed when the container starts.

---

### 7. [07_dockerfile_for_java_application.Dockerfile](#07-dockerfile-for-java-applicationdockerfile)

**Use Case: Dockerfile for a Java application**

```dockerfile
# Use official Java image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the compiled Java application (JAR file)
COPY target/myapp.jar /app/myapp.jar

# Expose the application port
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar", "myapp.jar"]
```

**Explanation:**
- This Dockerfile runs a Java application by copying a compiled JAR file into the container.
- It exposes port 8080 for the application.

---

### 8. [08_dockerfile_with_environment_variables.Dockerfile](#08-dockerfile-with-environment-variablesdockerfile)

**Use Case: Dockerfile with environment variables**

```dockerfile
# Use official Node.js image
FROM node:14

# Set environment variables
ENV NODE_ENV=production
ENV PORT=8080

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install dependencies
RUN npm install

# Expose port
EXPOSE $PORT

# Run the application
CMD ["npm", "start"]
```

**Explanation:**
- This Dockerfile uses `ENV` to define environment variables that can be used in the container.
- The environment variables are used to configure the application, such as setting the `PORT`.

---

### 9. [09_dockerfile_for_nodejs_application.Dockerfile](#09-dockerfile-for-nodejs-applicationdockerfile)

**Use Case: Dockerfile for a Node.js application**

```dockerfile
# Use official Node.js image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy the application code
COPY . /app

# Expose port 3000
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
```

**Explanation:**
- This Dockerfile sets up a Node.js application by copying the `package.json` file and installing the dependencies before copying the rest of the code.

---

### 10. [10_dockerfile_with_docker-compose.Dockerfile](#10-dockerfile-with-docker-composedockerfile)

**Use Case: Dockerfile to be used with Docker Compose**

```dockerfile
# Use official Python image
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
```

**Explanation:**
- This Dockerfile is used in conjunction with a `docker-compose.yml` file to manage multi-container setups.

---
