# Docker Compose Basics

Docker Compose is a tool that allows you to define and manage multi-container Docker applications. Using a `docker-compose.yml` file, you can specify the services, networks, and volumes for your application. It simplifies the process of running complex applications by defining all the components in a single file and managing them with simple commands.

## Table of Contents
1. [What is Docker Compose?](#what-is-docker-compose)
2. [Why Use Docker Compose?](#why-use-docker-compose)
3. [Installation of Docker Compose](#installation-of-docker-compose)
4. [Basic Concepts in Docker Compose](#basic-concepts-in-docker-compose)
   - Services
   - Networks
   - Volumes
5. [Writing a Simple `docker-compose.yml` File](#writing-a-simple-docker-composeyml-file)
6. [Docker Compose Commands](#docker-compose-commands)
7. [Example: Running a Multi-Container Application](#example-running-a-multi-container-application)
8. [Best Practices for Docker Compose](#best-practices-for-docker-compose)
9. [Troubleshooting Docker Compose](#troubleshooting-docker-compose)

---

### What is Docker Compose?

Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to define an entire application, including all of its services (such as a web server, database, cache, etc.), networks, and volumes, in a YAML file. With Docker Compose, you can start and stop all the containers needed for your app with a single command, making it easy to manage and scale your applications.

---

### Why Use Docker Compose?

- **Simplified Multi-Container Management**: Compose simplifies managing complex applications by allowing you to define all services in one file. This is particularly useful for apps that rely on multiple containers, such as web apps with a database.
- **Easier Setup and Tear Down**: You can spin up and tear down your entire application environment with a single command, making it ideal for development, testing, and production environments.
- **Portability**: Since the configuration is defined in a `docker-compose.yml` file, you can easily share your application setup across different environments or with team members.
- **Consistent Development Environment**: With Docker Compose, developers can ensure they’re using the same configuration, avoiding "works on my machine" problems.

---

### Installation of Docker Compose

To install Docker Compose, follow these steps:

#### On Linux (Ubuntu):
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
To verify the installation:
```bash
docker-compose --version
```

#### On macOS and Windows:
Docker Compose comes pre-installed with Docker Desktop for both macOS and Windows. Simply download and install [Docker Desktop](https://www.docker.com/products/docker-desktop) and Docker Compose will be available.

---

### Basic Concepts in Docker Compose

Before writing a `docker-compose.yml` file, it's essential to understand some key concepts:

#### 1. Services

A service in Docker Compose defines a container. It can specify details like the Docker image to use, environment variables, ports to expose, and more. Each service can depend on other services, and they can all communicate with each other over networks defined in the Compose file.

Example of a service definition:
```yaml
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
```

#### 2. Networks

Docker Compose allows you to define custom networks for services to communicate with each other. By default, Compose creates a default network for your services, but you can specify your own.

Example of network definition:
```yaml
networks:
  front-end:
    driver: bridge
```

#### 3. Volumes

Volumes in Docker Compose allow you to persist data outside of containers. You can define volumes for services that need persistent storage, like databases.

Example of volume definition:
```yaml
volumes:
  db_data:
```

---

### Writing a Simple `docker-compose.yml` File

Here’s an example of a basic `docker-compose.yml` file for a simple web app with a backend database.

```yaml
version: '3'
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    networks:
      - front-end
    depends_on:
      - db

  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: example
    volumes:
      - db_data:/var/lib/mysql
    networks:
      - back-end

networks:
  front-end:
  back-end:

volumes:
  db_data:
```

In this example:
- **web**: Runs an Nginx container and exposes port 80 to port 8080 on the host machine.
- **db**: Runs a MySQL container with a defined root password and a volume for data persistence.
- **networks**: Defines `front-end` and `back-end` networks.
- **volumes**: Defines a volume named `db_data` for MySQL’s data persistence.

---

### Docker Compose Commands

Here are the most commonly used Docker Compose commands:

- **`docker-compose up`**: Builds, (re)creates, starts, and attaches to containers for a service.
    ```bash
    docker-compose up
    ```
- **`docker-compose down`**: Stops and removes containers, networks, and volumes defined in the Compose file.
    ```bash
    docker-compose down
    ```
- **`docker-compose build`**: Builds or rebuilds services.
    ```bash
    docker-compose build
    ```
- **`docker-compose logs`**: Fetches logs for a specific service or all services.
    ```bash
    docker-compose logs
    ```
- **`docker-compose exec`**: Executes a command in a running container.
    ```bash
    docker-compose exec web bash
    ```
- **`docker-compose ps`**: Lists containers for the current Compose project.
    ```bash
    docker-compose ps
    ```

---

### Example: Running a Multi-Container Application

Let's walk through a simple example where we create a multi-container application with Docker Compose.

1. **Create a directory** for your project:
   ```bash
   mkdir my-docker-app
   cd my-docker-app
   ```

2. **Create a `docker-compose.yml` file**:
   Add the following content to your `docker-compose.yml` file:
   ```yaml
   version: '3'
   services:
     web:
       image: nginx:latest
       ports:
         - "8080:80"
     db:
       image: mysql:5.7
       environment:
         MYSQL_ROOT_PASSWORD: example
   ```

3. **Start the application**:
   Run `docker-compose up` to start both the web and db containers:
   ```bash
   docker-compose up
   ```
   You should now be able to access the Nginx web server by going to `http://localhost:8080`.

4. **Stop the application**:
   Once you’re done, you can stop the application using `docker-compose down`:
   ```bash
   docker-compose down
   ```

---

### Best Practices for Docker Compose

- **Version Control**: Always keep your `docker-compose.yml` file under version control (e.g., Git) to track changes and share configurations with team members.
- **Separation of Environments**: Use different Compose files for development, testing, and production. For example, you can have `docker-compose.dev.yml` for development and `docker-compose.prod.yml` for production.
- **Service Dependencies**: Use `depends_on` to ensure that services are started in the correct order. However, `depends_on` does not wait for a service to be "ready" (e.g., a database being ready to accept connections).
- **Environment Variables**: Use `.env` files or Docker secrets to manage sensitive information like passwords.

---

### Troubleshooting Docker Compose

If you encounter issues with Docker Compose, try the following:

- **Check Logs**: Use `docker-compose logs` to view the logs of all containers.
- **Verify Service Health**: Ensure that services are healthy and running as expected.
- **Rebuild Containers**: If changes aren’t reflected, try rebuilding the containers with `docker-compose up --build`.

For more advanced troubleshooting, check Docker’s official documentation or the logs for each individual service.

---

### Conclusion

Docker Compose is an essential tool for managing multi-container applications. With it, you can define, deploy, and scale complex applications in a simple and portable way. This document has covered the basics of Docker Compose, from installation to writing Compose files and using commands. For more advanced features, you can explore Docker's official documentation or continue experimenting with more complex service configurations.

---
