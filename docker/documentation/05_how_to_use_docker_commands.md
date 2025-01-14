# How to Use Docker Commands

Docker commands are essential for interacting with Docker containers and images. This document explains the most commonly used Docker commands, with examples and a step-by-step guide on how to use them.

---

## 1. **docker --version**

This command is used to check the version of Docker installed on your machine.

```bash
docker --version
```

### Example Output:
```
Docker version 20.10.7, build f0df350
```

---

## 2. **docker info**

The `docker info` command provides detailed information about your Docker installation, including the number of containers, images, and the Docker version.

```bash
docker info
```

### Example Output:
```
Client:
 Cloud integration: v1.0.0
...

Server:
 Containers: 3
  Running: 2
  Paused: 0
  Stopped: 1
 Images: 10
...
```

---

## 3. **docker pull**

The `docker pull` command is used to download an image from Docker Hub or a private registry.

```bash
docker pull <image_name>:<tag>
```

### Example:

```bash
docker pull ubuntu:latest
```

This command downloads the `ubuntu` image with the `latest` tag from Docker Hub.

---

## 4. **docker build**

The `docker build` command is used to create a Docker image from a Dockerfile.

```bash
docker build -t <image_name>:<tag> <path_to_dockerfile>
```

### Example:

```bash
docker build -t my_image:1.0 .
```

This command builds a Docker image named `my_image` with tag `1.0` using the Dockerfile in the current directory (`.`).

---

## 5. **docker images**

The `docker images` command lists all Docker images available locally.

```bash
docker images
```

### Example Output:
```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              latest              6c3e42392eb5        3 days ago          73.9MB
nginx               stable              d44e3b592a10        2 weeks ago         132MB
```

---

## 6. **docker ps**

The `docker ps` command lists all the running containers.

```bash
docker ps
```

### Example Output:
```
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
d4a68a2dbada        ubuntu:latest       "/bin/bash"         2 hours ago         Up 2 hours                              my_container
```

---

## 7. **docker ps -a**

Use `docker ps -a` to list **all** containers, whether they are running or stopped.

```bash
docker ps -a
```

---

## 8. **docker run**

The `docker run` command is used to start a new container from a specific image.

```bash
docker run <options> <image_name> <command>
```

### Common options:

- `-d` (detached mode): Runs the container in the background.
- `-p <host_port>:<container_port>`: Maps a port on the host to a port inside the container.
- `--name <container_name>`: Assigns a custom name to the container.

### Example:

```bash
docker run -d -p 8080:80 --name web_server nginx
```

This command runs the `nginx` image in detached mode, mapping port 8080 on the host to port 80 in the container, and names the container `web_server`.

---

## 9. **docker exec**

The `docker exec` command allows you to run a command in a running container.

```bash
docker exec -it <container_name_or_id> <command>
```

### Example:

```bash
docker exec -it web_server bash
```

This command opens an interactive Bash shell inside the running `web_server` container.

---

## 10. **docker stop**

The `docker stop` command is used to stop a running container.

```bash
docker stop <container_name_or_id>
```

### Example:

```bash
docker stop web_server
```

This command stops the `web_server` container.

---

## 11. **docker start**

The `docker start` command is used to start a stopped container.

```bash
docker start <container_name_or_id>
```

### Example:

```bash
docker start web_server
```

This command starts the `web_server` container again.

---

## 12. **docker restart**

The `docker restart` command restarts a running container.

```bash
docker restart <container_name_or_id>
```

### Example:

```bash
docker restart web_server
```

This command restarts the `web_server` container.

---

## 13. **docker rm**

The `docker rm` command is used to remove a stopped container.

```bash
docker rm <container_name_or_id>
```

### Example:

```bash
docker rm web_server
```

This command removes the stopped `web_server` container.

---

## 14. **docker rmi**

The `docker rmi` command is used to remove a Docker image from the local system.

```bash
docker rmi <image_name>:<tag>
```

### Example:

```bash
docker rmi my_image:1.0
```

This command removes the image `my_image` with tag `1.0`.

---

## 15. **docker logs**

The `docker logs` command retrieves the logs from a running or stopped container.

```bash
docker logs <container_name_or_id>
```

### Example:

```bash
docker logs web_server
```

This command shows the logs of the `web_server` container.

---

## 16. **docker network ls**

The `docker network ls` command lists all Docker networks.

```bash
docker network ls
```

---

## 17. **docker volume ls**

The `docker volume ls` command lists all Docker volumes.

```bash
docker volume ls
```

---

## 18. **docker-compose**

Docker Compose is a tool used to define and run multi-container Docker applications. You can manage all the containers in a single file using `docker-compose.yml`. Here are some common commands:

### `docker-compose up`

Starts up the containers defined in a `docker-compose.yml` file.

```bash
docker-compose up
```

### `docker-compose down`

Stops and removes containers, networks, and volumes defined in a `docker-compose.yml` file.

```bash
docker-compose down
```

---

## 19. **docker info**

The `docker info` command provides detailed information about Docker on your system, including the number of containers and images, storage driver, and system resources.

```bash
docker info
```

---

## 20. **docker tag**

The `docker tag` command is used to create a new tag for an existing image.

```bash
docker tag <image_name>:<old_tag> <image_name>:<new_tag>
```

### Example:

```bash
docker tag ubuntu:latest ubuntu:v20.04
```

This command tags the `ubuntu:latest` image with a new tag `v20.04`.

---

## Conclusion

These are some of the most commonly used Docker commands for managing containers and images. Understanding and utilizing these commands will help you work efficiently with Docker in both development and production environments.

---

This document covers the full range of basic Docker commands, providing explanations, examples, and practical uses. You can expand on it with additional commands as you progress with Docker.