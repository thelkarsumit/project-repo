# 02 - How to Install Jenkins

## Introduction
Jenkins is an open-source automation server widely used for Continuous Integration (CI) and Continuous Delivery (CD) in software development. It helps automate repetitive tasks involved in building, testing, and deploying software. This document provides step-by-step instructions to install Jenkins on various systems.

## Prerequisites
Before installing Jenkins, ensure that the following requirements are met:
- A machine with at least 2 GB of RAM.
- A stable internet connection to download necessary packages.
- Java 8 or higher installed (Jenkins requires Java to run).

### Verify Java Installation
Jenkins runs on Java, so make sure you have Java installed. You can check the installed version by running:

```bash
java -version
```

If Java is not installed or the version is below 8, follow the steps below to install it.

#### Install Java on Ubuntu/Debian
```bash
sudo apt update
sudo apt install openjdk-11-jdk
```

#### Install Java on CentOS/RHEL
```bash
sudo yum install java-11-openjdk-devel
```

## 1. Installing Jenkins on Ubuntu/Debian

### Step 1: Update System Packages
First, update your system’s package list and install any available updates:

```bash
sudo apt update
sudo apt upgrade
```

### Step 2: Add Jenkins Repository and Key
Jenkins provides a stable package repository for Ubuntu/Debian systems. First, add the Jenkins repository key:

```bash
wget -q -O - https://pkg.jenkins.io/ci.ubuntu.com/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins.asc
```

Add the Jenkins repository to your system’s source list:

```bash
echo "deb [signed-by=/usr/share/keyrings/jenkins.asc] https://pkg.jenkins.io/debian/ stable main" | sudo tee /etc/apt/sources.list.d/jenkins.list
```

### Step 3: Install Jenkins
Once the repository is added, update your package list and install Jenkins:

```bash
sudo apt update
sudo apt install jenkins
```

### Step 4: Start Jenkins Service
After installation, start the Jenkins service:

```bash
sudo systemctl start jenkins
```

### Step 5: Enable Jenkins to Start at Boot
To ensure Jenkins starts automatically when the system boots up, run:

```bash
sudo systemctl enable jenkins
```

### Step 6: Access Jenkins
Jenkins runs on port `8080` by default. To access Jenkins, open a web browser and navigate to:

```
http://localhost:8080
```

When you first access Jenkins, you will be asked to unlock it by providing an initial admin password.

### Step 7: Retrieve the Initial Admin Password
To retrieve the initial admin password, run the following command:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the password and paste it into the Jenkins setup page to complete the installation.

### Step 8: Install Suggested Plugins
After unlocking Jenkins, the setup wizard will prompt you to install plugins. Select "Install suggested plugins" for a smooth experience, or you can select the plugins manually.

### Step 9: Set Up Admin User
Once the plugins are installed, you will be asked to create an admin user with a username, password, and email. This step is optional, as you can also use the initial admin password.

---

## 2. Installing Jenkins on CentOS/RHEL

### Step 1: Update System Packages
Update the system and install any available updates:

```bash
sudo yum update
```

### Step 2: Add Jenkins Repository
Add the Jenkins repository to your system:

```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
```

Import the Jenkins repository key:

```bash
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
```

### Step 3: Install Jenkins
Now, install Jenkins:

```bash
sudo yum install jenkins
```

### Step 4: Start Jenkins Service
Start Jenkins using systemd:

```bash
sudo systemctl start jenkins
```

### Step 5: Enable Jenkins at Boot
Enable Jenkins to start automatically at boot:

```bash
sudo systemctl enable jenkins
```

### Step 6: Access Jenkins
Open a browser and navigate to:

```
http://localhost:8080
```

Follow the same steps as in the Ubuntu section to unlock Jenkins, install plugins, and create an admin user.

---

## 3. Installing Jenkins Using Docker

If you prefer using Docker, Jenkins provides a Docker image for easy setup.

### Step 1: Install Docker
Follow the [official Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.

### Step 2: Run Jenkins in a Docker Container
Pull the official Jenkins Docker image:

```bash
docker pull jenkins/jenkins:lts
```

Run Jenkins using Docker:

```bash
docker run -d -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
```

You can now access Jenkins by navigating to:

```
http://localhost:8080
```

---

## 4. Installing Jenkins on Windows

Jenkins can also be installed on Windows using an MSI installer.

### Step 1: Download Jenkins MSI Installer
Download the MSI installer from the [Jenkins website](https://www.jenkins.io/download/).

### Step 2: Run the Installer
Run the installer and follow the on-screen instructions to install Jenkins.

### Step 3: Start Jenkins
Once the installation is complete, Jenkins will automatically start as a Windows service.

### Step 4: Access Jenkins
Open your browser and go to:

```
http://localhost:8080
```

---

## 5. Troubleshooting Common Installation Issues

### Jenkins Not Starting
If Jenkins fails to start, check the logs to see if there are any errors:

```bash
sudo journalctl -u jenkins
```

### Port Already in Use
If port `8080` is already in use, you can change the port by editing the Jenkins configuration file:

```bash
sudo nano /etc/default/jenkins  # Ubuntu/Debian
```

Change the `HTTP_PORT` value to a different port (e.g., `8081`).

---

## Conclusion
You’ve successfully installed Jenkins on your system. Now, you can start using Jenkins to automate your build and deployment pipelines. Be sure to explore Jenkins’ rich set of plugins, pipelines, and configuration options to fully leverage its capabilities in your CI/CD workflow.

For additional configurations and advanced features, refer to the [official Jenkins documentation](https://www.jenkins.io/doc/).

---