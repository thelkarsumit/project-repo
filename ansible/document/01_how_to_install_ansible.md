# How Ansible Works

Ansible is an open-source automation tool that allows you to automate IT infrastructure tasks such as configuration management, application deployment, and task execution.

## Key Points:
1. Ansible uses a simple YAML-based language (Playbooks).
2. It communicates with remote machines over SSH.
3. It requires no agents on target machines, just SSH and Python.

For more details on Ansible architecture, refer to the official documentation: [Ansible Documentation](https://docs.ansible.com/)

## How to Install Ansible

Ansible can be installed on various operating systems using different methods. Below are the installation steps for some common platforms:

- On Ubuntu/Debian:
```bash
sudo apt update
sudo apt install ansible


- On CentOS/RHEL:
'''bash
sudo yum install epel-release
sudo yum install ansible
