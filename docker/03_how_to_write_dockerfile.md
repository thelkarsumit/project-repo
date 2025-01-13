# 03: How to Write a Dockerfile

## Introduction

A **Dockerfile** is a script containing a series of instructions on how to build a Docker image. The Docker image will be based on the instructions in the Dockerfile, which can include commands for installing software, copying files, setting environment variables, and specifying how the container should run.

This guide will walk you through the essential steps and commands used to write a Dockerfile.

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

## Step-by-Step Example

Let's walk through a simple example of a Dockerfile for a Node.js application.

### Example 1: A Simple Node.js Dockerfile

```Dockerfile
# Use the official Node.js image as a base
FROM node:14

# Set metadata
LABEL maintainer="your-email@example.com"
LABEL version="1.0"

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first for dependency caching
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
```

### Breakdown of Instructions

1. **FROM node:14**: This pulls the official Node.js image, version 14, from Docker Hub. This image includes Node.js and npm, so we don't have to install them manually.
2. **LABEL**: These are optional metadata tags you can attach to your Docker image. They help identify the image.
3. **WORKDIR /app**: Sets `/app` as the working directory inside the container. All subsequent paths are relative to this directory.
4. **COPY package*.json ./**: Copies the `package.json` and `package-lock.json` files into the container. Using this pattern helps cache dependencies.
5. **RUN npm install**: Installs the Node.js dependencies inside the container.
6. **COPY . .**: Copies the rest of the application files (including code, config files, etc.) into the container.
7. **EXPOSE 3000**: Tells Docker that the container will use port 3000.
8. **CMD ["npm", "start"]**: Defines the command to run when the container starts. In this case, it runs `npm start`, which will start the Node.js application.

---

## Commonly Used Dockerfile Instructions

### 1. **FROM**: The Base Image

The `FROM` instruction defines the base image for the Docker image you're building. For example:

```Dockerfile
FROM ubuntu:20.04
```

This means your Docker image will be built on top of Ubuntu 20.04. You can use other images, such as `node`, `python`, `nginx`, etc.

### 2. **RUN**: Execute Commands

The `RUN` instruction executes commands in the shell inside the container during the image build. For example:

```Dockerfile
RUN apt-get update && apt-get install -y curl
```

This runs a package manager command to install `curl`.

### 3. **COPY vs ADD**

- **COPY**: Copies files from the host machine to the container. It's the recommended instruction for most use cases.
  
  ```Dockerfile
  COPY ./src /app/src
  ```

- **ADD**: Similar to `COPY`, but it also supports extracting tar archives and fetching files from URLs.

  ```Dockerfile
  ADD http://example.com/big.tar.gz /var/www/html/
  ```

Use `COPY` unless you need `ADD`'s additional features.

### 4. **CMD vs ENTRYPOINT**

- **CMD**: Defines the default command to run when the container starts. This can be overridden when starting the container.

  ```Dockerfile
  CMD ["python", "app.py"]
  ```

- **ENTRYPOINT**: Similar to `CMD`, but the command defined in `ENTRYPOINT` will always run. It can be combined with `CMD` for default arguments.

  ```Dockerfile
  ENTRYPOINT ["python", "app.py"]
  CMD ["--help"]
  ```

In this case, `python app.py --help` is the default, but you can override the `CMD` part.

---

## Best Practices for Writing Dockerfiles

1. **Use Official Images**: Always try to use official base images from Docker Hub to ensure security and stability.
   
2. **Minimize Layers**: Each instruction creates a layer in the image, so combine multiple `RUN` commands into one to reduce image size.

   ```Dockerfile
   RUN apt-get update && apt-get install -y curl && apt-get clean
   ```

3. **Use `.dockerignore`**: Avoid including unnecessary files in the Docker image by specifying them in a `.dockerignore` file (similar to `.gitignore`).

4. **Use Specific Versions**: When using base images or dependencies, specify a specific version to avoid unexpected updates.

   ```Dockerfile
   FROM node:14.17.0
   ```

5. **Clean Up After Installation**: Always clean up caches and unnecessary files after installing packages to reduce the image size.

   ```Dockerfile
   RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists/*
   ```

---

## Additional Tips

- **Multi-Stage Builds**: Use multi-stage builds to optimize the Docker image size by creating separate stages for building and running the application.

  ```Dockerfile
  # Build stage
  FROM node:14 AS build
  WORKDIR /app
  COPY . .
  RUN npm install

  # Final stage
  FROM node:14
  WORKDIR /app
  COPY --from=build /app /app
  CMD ["npm", "start"]
  ```

- **Environment Variables**: Use the `ENV` instruction to set environment variables for use in the container.

  ```Dockerfile
  ENV NODE_ENV production
  ```

---

## Conclusion

Writing a Dockerfile is about defining the steps needed to assemble a Docker image for your application. By understanding the key Dockerfile instructions, you can easily create reproducible, portable, and efficient Docker images. 

As you gain more experience, you will get comfortable with optimizing Dockerfiles for speed, size, and security.

---
