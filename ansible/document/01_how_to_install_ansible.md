# Ansible Overview

Ansible is an open-source automation tool that simplifies the automation of IT infrastructure tasks such as configuration management, application deployment, and task execution. It’s powerful, agentless, and easy to use.

## Key Features of Ansible:
1. **Declarative Language**: Ansible uses a simple YAML-based language known as Playbooks to define tasks.
2. **Agentless**: Ansible communicates with remote machines over SSH and requires no agents or additional software on target machines, making it lightweight and easy to deploy.
3. **Extensibility**: With a rich library of modules, you can automate tasks for a wide range of applications and services.

For more detailed information about Ansible architecture, visit the official [Ansible Documentation](https://docs.ansible.com/).

---

## How to Install Ansible

You can install Ansible on various operating systems. Below are installation instructions for common platforms:

### On Ubuntu/Debian:
```bash
sudo apt update
sudo apt install ansible
```
### On CentOS/RHEL:
```bash
sudo yum install epel-release
sudo yum install ansible
```