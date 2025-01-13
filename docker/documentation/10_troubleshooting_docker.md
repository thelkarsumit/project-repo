# Troubleshooting Docker

Docker is an incredibly powerful tool, but like any software, you might run into issues during use. This document will help you troubleshoot common Docker problems, step by step, to get you back on track quickly.

## Table of Contents
- [1. Docker Daemon Not Starting](#1-docker-daemon-not-starting)
- [2. Docker Commands Not Found](#2-docker-commands-not-found)
- [3. Container Fails to Start](#3-container-fails-to-start)
- [4. Network Issues in Docker Containers](#4-network-issues-in-docker-containers)
- [5. Docker Images Not Building](#5-docker-images-not-building)
- [6. Docker Containers Are Running But Not Accessible](#6-docker-containers-are-running-but-not-accessible)
- [7. Docker Container Exits Immediately](#7-docker-container-exits-immediately)
- [8. Docker Compose Not Working Correctly](#8-docker-compose-not-working-correctly)
- [9. Docker Volume Issues](#9-docker-volume-issues)
- [10. Docker Logs and Debugging](#10-docker-logs-and-debugging)

## 1. Docker Daemon Not Starting

### Symptoms:
- Docker service won’t start or stops unexpectedly.
- Error message: `Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?`

### Potential Causes:
- Docker daemon is not running.
- Insufficient permissions for the Docker socket.
- Misconfiguration of Docker service.

### Solutions:
1. **Check if Docker service is running:**
   ```bash
   sudo systemctl status docker
   ```
   If the service is inactive, restart it:
   ```bash
   sudo systemctl start docker
   ```

2. **Check Docker logs:**
   View Docker logs to understand why it’s not starting:
   ```bash
   sudo journalctl -u docker
   ```

3. **Check permissions:**
   If you're getting permission errors, make sure your user is in the `docker` group:
   ```bash
   sudo usermod -aG docker $(whoami)
   ```
   After running the command, log out and log back in.

## 2. Docker Commands Not Found

### Symptoms:
- You receive errors like `bash: docker: command not found`.

### Potential Causes:
- Docker is not installed correctly.
- Docker’s binary is not in the system PATH.

### Solutions:
1. **Check if Docker is installed:**
   ```bash
   which docker
   ```
   If it’s not installed, follow the official installation instructions for your OS: https://docs.docker.com/get-docker/

2. **Ensure Docker is in your PATH:**
   Ensure that `/usr/local/bin/` (where Docker is usually installed) is included in your PATH environment variable.

## 3. Container Fails to Start

### Symptoms:
- A container starts but stops immediately.
- Error message: `Exited (1)`, `Exited (137)`.

### Potential Causes:
- Misconfigured container startup command.
- Missing required files or dependencies inside the container.

### Solutions:
1. **Check the container logs:**
   Inspect the container logs to see what caused the failure:
   ```bash
   docker logs <container_id>
   ```

2. **Check for missing dependencies:**
   If your container relies on specific files or environment variables, make sure they are present and correctly configured.

3. **Run the container in interactive mode:**
   You can try running the container interactively to debug:
   ```bash
   docker run -it <image_name> /bin/bash
   ```

## 4. Network Issues in Docker Containers

### Symptoms:
- Containers can’t communicate with each other or with the outside world.
- Error message: `network unreachable`.

### Potential Causes:
- Incorrect network configuration.
- Missing or misconfigured port bindings.

### Solutions:
1. **Check network settings:**
   Ensure your containers are on the correct network:
   ```bash
   docker network ls
   docker network inspect <network_name>
   ```

2. **Inspect firewall settings:**
   Ensure that your firewall is not blocking the Docker network bridge. You may need to adjust firewall settings.

3. **Verify port binding:**
   Make sure you’ve correctly mapped container ports to host ports:
   ```bash
   docker run -p <host_port>:<container_port> <image_name>
   ```

## 5. Docker Images Not Building

### Symptoms:
- You encounter errors while building a Docker image.
- Errors like `failed to solve: unable to find a build definition`.

### Potential Causes:
- Syntax errors in the Dockerfile.
- Incorrect paths to files in the Dockerfile.

### Solutions:
1. **Check the Dockerfile:**
   Double-check for any syntax or logical errors in your Dockerfile. Make sure the `COPY` or `ADD` commands reference valid files:
   ```dockerfile
   COPY ./myfile.txt /app/myfile.txt
   ```

2. **Rebuild the image:**
   If the image fails to build, clean the Docker cache and rebuild:
   ```bash
   docker builder prune
   docker build -t my_image .
   ```

## 6. Docker Containers Are Running But Not Accessible

### Symptoms:
- Container is running but not accessible via exposed ports or IP.
- Error message: `Connection Refused` or `Timeout`.

### Potential Causes:
- Incorrect port mapping or firewall settings.
- The application inside the container is not listening on the expected IP/port.

### Solutions:
1. **Check the container logs for binding errors:**
   ```bash
   docker logs <container_id>
   ```

2. **Verify port mapping:**
   Make sure that the container's ports are correctly mapped to the host machine:
   ```bash
   docker run -p <host_port>:<container_port> <image_name>
   ```

## 7. Docker Container Exits Immediately

### Symptoms:
- A container exits as soon as it’s started.
- Error message: `Exit Code: 137` or `Exit Code: 1`.

### Potential Causes:
- The entrypoint or CMD in your Dockerfile might be failing.
- Insufficient resources (e.g., out of memory).

### Solutions:
1. **Check container logs:**
   ```bash
   docker logs <container_id>
   ```

2. **Run the container interactively:**
   Use the interactive mode to identify the issue:
   ```bash
   docker run -it <image_name> /bin/bash
   ```

## 8. Docker Compose Not Working Correctly

### Symptoms:
- Docker Compose fails to start services or throws errors about missing dependencies.

### Potential Causes:
- Incorrect syntax in `docker-compose.yml`.
- Missing environment variables or files.

### Solutions:
1. **Validate the YAML syntax:**
   Use a YAML validator to check for syntax errors in the `docker-compose.yml` file.

2. **Check service dependencies:**
   Ensure that all services are correctly defined and that any required environment variables or volumes are set.

## 9. Docker Volume Issues

### Symptoms:
- Docker containers cannot read/write data from volumes.
- Error message: `Permission Denied`.

### Potential Causes:
- Permissions issues with the volume directory.
- Misconfigured volume mounts in the `docker-compose.yml` file or `docker run` command.

### Solutions:
1. **Check directory permissions:**
   Ensure that the host directory used for the volume has appropriate read/write permissions.

2. **Inspect volumes:**
   View Docker volumes and check if they are mounted properly:
   ```bash
   docker volume ls
   docker volume inspect <volume_name>
   ```

## 10. Docker Logs and Debugging

### Symptoms:
- Difficulty in identifying the cause of an issue.

### Solutions:
1. **Use Docker logs:**
   Always start by checking logs for both containers and the Docker daemon.
   ```bash
   docker logs <container_id>
   sudo journalctl -u docker
   ```

2. **Increase Docker logging level:**
   For more detailed logs, increase the logging level in the Docker daemon configuration and restart Docker.

3. **Use Docker’s built-in debugging tools:**
   ```bash
   docker info
   docker version
   ```

---


