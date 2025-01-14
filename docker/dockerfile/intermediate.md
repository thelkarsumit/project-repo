# List intermediate Dockerfile use cases, along with detailed explanations.

---
## Basic Structure of a Dockerfile

A Dockerfile is typically composed of several instructions, each building on the previous one. Here is the basic syntax:

```Dockerfile
# Comment
INSTRUCTION value
```

### Key Dockerfile Instructions

1. **FROM**: Specifies the base image for your Docker image. Every Dockerfile starts with this instruction.
2. **LABEL**: Adds metadata to the image.
3. **RUN**: Executes commands inside the container during the build process.
4. **COPY**: Copies files from your local machine to the image.
5. **ADD**: Similar to COPY but with additional functionality (e.g., downloading files from URLs).
6. **WORKDIR**: Sets the working directory for subsequent instructions.
7. **CMD**: Specifies the default command to run when the container starts.
8. **ENTRYPOINT**: Defines the command that will always run, which can be overridden by CMD.
9. **ENV**: Sets environment variables.
10. **EXPOSE**: Defines the ports the container will use.
11. **VOLUME**: Creates mount points and links them to directories on the host.
12. **USER**: Specifies the user to use when running the container.

---
# Table of Contents
1. [01_dockerfile_for_python_application.md](#01_dockerfile-for-python-application)
2. [02_dockerfile_for_nodejs_application.md](#02_dockerfile-for-nodejs-application)
3. [03_dockerfile_for_java_application.md](#03_dockerfile-for-java-application)
4. [04_dockerfile_for-nginx-and-php.md](#04_dockerfile-for-nginx-and-php)
5. [05_dockerfile-for-multi-stage-build.md](#05-dockerfile-for-multi-stage-build)
6. [06_dockerfile-for-go-application.md](#06-dockerfile-for-go-application)
7. [07_dockerfile-for-mysql-database.md](#07-dockerfile-for-mysql-database)
8. [08_dockerfile-for-ruby-on-rails.md](#08-dockerfile-for-ruby-on-rails)
9. [09_dockerfile-for-redis-with-persistent-storage.md](#09-dockerfile-for-redis-with-persistent-storage)
10. [10_dockerfile-for-docker-compose-environment.md](#10-dockerfile-for-docker-compose-environment)

---

## 01_dockerfile_for_python_application.md

### Use Case: Dockerfile for Python Application

This Dockerfile will set up a Python application and install the necessary dependencies using `requirements.txt`.

### Dockerfile:

```dockerfile
# Use official Python base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
```

### Explanation:
- We use `python:3.8-slim` as the base image.
- Set the working directory to `/app`.
- Install the Python dependencies listed in `requirements.txt`.
- Copy the rest of the application code into the container.
- Expose port `5000` for the application.
- The container will run `app.py` by default when started.

---

## 02_dockerfile_for_nodejs_application.md

### Use Case: Dockerfile for Node.js Application

This Dockerfile will set up a Node.js application with dependencies from `package.json`.

### Dockerfile:

```dockerfile
# Use official Node.js base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
```

### Explanation:
- The `node:14` image is used as a base.
- It sets the working directory to `/app`.
- Copies `package.json` and installs dependencies via `npm install`.
- Exposes port `3000` to access the app externally.
- By default, `npm start` will run the app.

---

## 03_dockerfile_for_java_application.md

### Use Case: Dockerfile for Java Application

This Dockerfile sets up a Java application and builds it using Maven.

### Dockerfile:

```dockerfile
# Use OpenJDK base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven build file and dependencies
COPY pom.xml .

# Download and install dependencies
RUN mvn dependency:go-offline

# Copy the rest of the application code
COPY src /app/src

# Build the application
RUN mvn clean install

# Expose the port the application will run on
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar", "target/app.jar"]
```

### Explanation:
- Uses the `openjdk:11-jre-slim` base image.
- Copies the `pom.xml` file and installs dependencies via Maven.
- Copies the application source code into the container.
- Runs Maven to build the application.
- Exposes port `8080` to make the app accessible.

---

## 04_dockerfile_for-nginx-and-php.md

### Use Case: Dockerfile for Nginx and PHP-FPM Application

This Dockerfile sets up a PHP application served by Nginx.

### Dockerfile:

```dockerfile
# Use official Nginx base image
FROM nginx:alpine

# Install PHP and necessary extensions
RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-session

# Set the working directory
WORKDIR /var/www/html

# Copy the PHP application into the container
COPY . .

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports for both Nginx (80) and PHP (9000)
EXPOSE 80 9000

# Start PHP-FPM and Nginx
CMD ["sh", "-c", "php-fpm7 && nginx -g 'daemon off;'"]
```

### Explanation:
- We use `nginx:alpine` for the base image.
- Install PHP and necessary extensions using Alpine package manager.
- Copy the application code and custom `nginx.conf` file.
- Expose ports `80` for Nginx and `9000` for PHP-FPM.

---

## 05_dockerfile_for-multi-stage-build.md

### Use Case: Dockerfile for Multi-stage Build

This Dockerfile demonstrates a multi-stage build to optimize the final image size.

### Dockerfile:

```dockerfile
# First stage: Build the application
FROM node:14 AS build-stage

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Second stage: Run the application
FROM nginx:alpine

# Copy the build from the first stage
COPY --from=build-stage /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
```

### Explanation:
- In the first stage, we use a Node.js image to build the application.
- In the second stage, we use Nginx to serve the built application, minimizing the size of the final image by excluding build tools.

---

## 06_dockerfile_for-go-application.md

### Use Case: Dockerfile for Go Application

This Dockerfile builds and runs a Go application.

### Dockerfile:

```dockerfile
# Use Golang base image to build the app
FROM golang:1.16-alpine AS build

# Set the working directory
WORKDIR /go/src/app

# Copy the Go module files
COPY go.mod go.sum ./

# Install dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the Go application
RUN go build -o myapp

# Second stage: Run the application
FROM alpine:latest

WORKDIR /root/

# Copy the binary from the build stage
COPY --from=build /go/src/app/myapp .

# Expose the port
EXPOSE 8080

# Run the Go app
CMD ["./myapp"]
```

### Explanation:
- The Go application is built in a `golang:1.16-alpine` image.
- The final image is smaller because we only copy the built binary to an Alpine image.

---

## 07_dockerfile_for-mysql-database.md

### Use Case: Dockerfile for MySQL Database

This Dockerfile sets up a MySQL database with initialization scripts.

### Dockerfile:

```dockerfile
# Use official MySQL base image
FROM mysql:5.7

# Set environment variables for MySQL root password
ENV MYSQL_ROOT_PASSWORD=root

# Copy initialization scripts to be executed on container startup
COPY ./init.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306
```

### Explanation:
- Uses the official `mysql:5.7` image.
- Sets environment variables for the root password.
- Copies SQL initialization scripts into the container’s `docker-entrypoint-initdb.d/` directory to be run on first container start.

---

## 08_dockerfile_for-ruby-on-rails.md

### Use Case: Dockerfile for Ruby on Rails

This Dockerfile sets up a Ruby on Rails application.

### Dockerfile:

```dockerfile
# Use Ruby base image
FROM ruby:2.7

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /myapp

# Copy the Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
```

### Explanation:
- Uses `ruby:2.7` as the base image and installs Node.js and PostgreSQL client.
- Installs Ruby dependencies via `bundle install`.
- Starts the Rails server on port `3000`.

---

## 09_dockerfile_for-redis-with-persistent-storage.md

### Use Case: Dockerfile for Redis with Persistent Storage

This Dockerfile configures Redis with persistent data storage.

### Dockerfile:

```dockerfile
# Use official Redis image
FROM redis:alpine

# Configure persistent data storage for Redis
VOLUME ["/data"]

# Expose Redis port
EXPOSE 6379

# Command to run Redis server
CMD ["redis-server", "--appendonly", "yes"]
```

### Explanation:
- Uses the official Redis image and configures persistent storage with the `VOLUME` directive.
- Exposes Redis on port `6379`.

---

## 10_dockerfile_for-docker-compose-environment.md

### Use Case: Dockerfile for Docker Compose Environment

This example shows how to use Docker Compose with a multi-container setup.

### docker-compose.yml:

```yaml
version: "3.8"

services:
  web:
    build: ./web
    ports:
      - "5000:5000"
  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: root
```

### Explanation:
- The `docker-compose.yml` file defines two services: a web application built from the `web` directory, and a MySQL database.

---