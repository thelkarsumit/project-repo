# How to Install Docker

This document will guide you through the process of installing Docker on various platforms, including Linux, macOS, and Windows. Docker is a tool designed to make it easier to create, deploy, and run applications by using containers.

## Prerequisites

Before you begin, ensure that your system meets the following prerequisites:

- **For Linux**: A supported version of Linux (Ubuntu, Debian, CentOS, etc.) with administrative (root) access.
- **For macOS and Windows**: A modern version of the operating system (macOS 10.13 or later for macOS, and Windows 10 64-bit or later for Windows).

## Step 1: Install Docker on Ubuntu (Linux)

### 1.1 Update Your System
Before installing Docker, it’s a good idea to update the package database. Run the following command:

```bash
sudo apt-get update
```

### 1.2 Install Dependencies
Docker requires a few dependencies, such as `apt-transport-https`, `ca-certificates`, and `curl`. Install them with:

```bash
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
```

### 1.3 Add Docker’s Official GPG Key
Docker packages are signed with a GPG key. Add this key to your system using:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

### 1.4 Add Docker Repository
Next, add Docker’s official repository to your system:

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

### 1.5 Install Docker
Update the package index again and install Docker:

```bash
sudo apt-get update
sudo apt-get install docker-ce
```

### 1.6 Verify Docker Installation
After the installation is complete, verify that Docker is installed correctly by checking the version:

```bash
docker --version
```

You should see output like `Docker version 20.10.8, build 3967b7d`.

### 1.7 Start and Enable Docker
By default, Docker should start automatically. You can check its status with:

```bash
sudo systemctl status docker
```

If it’s not started, you can start Docker with:

```bash
sudo systemctl start docker
```

To ensure Docker starts on boot:

```bash
sudo systemctl enable docker
```

## Step 2: Install Docker on macOS

### 2.1 Download Docker Desktop for Mac
1. Visit the official Docker website: https://www.docker.com/products/docker-desktop
2. Download the Docker Desktop application for macOS.

### 2.2 Install Docker Desktop
Once the `.dmg` file is downloaded, open it and drag the Docker application to your `Applications` folder.

### 2.3 Start Docker Desktop
Open Docker from the `Applications` folder and wait for the Docker whale icon to appear in the menu bar, indicating that Docker is running.

### 2.4 Verify Docker Installation
To check that Docker is installed and running, open your terminal and run:

```bash
docker --version
```

You should see the Docker version installed.

## Step 3: Install Docker on Windows

### 3.1 Download Docker Desktop for Windows
1. Go to the official Docker website: https://www.docker.com/products/docker-desktop
2. Download the Docker Desktop installer for Windows.

### 3.2 Install Docker Desktop
Run the installer after downloading. The installation process will take care of all required dependencies (like WSL 2). Follow the on-screen instructions, and allow Docker to enable the WSL 2 feature if prompted.

### 3.3 Enable WSL 2
Docker Desktop uses Windows Subsystem for Linux 2 (WSL 2) to run containers. If it's not already installed, Docker will guide you through the installation process during setup.

### 3.4 Start Docker Desktop
Once installation is complete, launch Docker Desktop. You will see the Docker whale icon in the taskbar indicating that Docker is running.

### 3.5 Verify Docker Installation
To verify Docker is installed correctly, open PowerShell and run:

```bash
docker --version
```

You should see the installed version of Docker.

## Step 4: Post-installation Steps (Linux Only)

### 4.1 Manage Docker as a Non-root User
By default, Docker requires `sudo` for most commands. If you want to run Docker as a non-root user, you can add your user to the Docker group:

```bash
sudo usermod -aG docker $USER
```

After running this command, log out and log back in for the changes to take effect.

### 4.2 Test Docker Installation
Run the following command to ensure Docker is working properly:

```bash
docker run hello-world
```

This will pull a test image from Docker Hub and run it, showing a success message if everything is set up correctly.

## Step 5: Troubleshooting Installation Issues

### 5.1 Docker Daemon Not Starting
If the Docker daemon is not starting, you can check the logs for more details:

```bash
sudo journalctl -u docker
```

### 5.2 Permissions Issues
If you encounter permissions issues while running Docker commands, ensure your user is added to the Docker group, as mentioned earlier in Step 4.1.

### 5.3 Docker Desktop Not Starting on macOS/Windows
- Ensure your system meets the minimum requirements for Docker Desktop (e.g., virtualization is enabled in BIOS).
- Check if Docker Desktop has enough resources (CPU, memory) allocated in the settings.

## Conclusion

Now that Docker is installed on your system, you can start creating containers and using Docker to deploy applications. Docker is a powerful tool for containerization and will help you streamline the development and deployment of your applications.
