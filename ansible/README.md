# Ansible Repository Structure

This repository contains various directories and files to manage infrastructure and automate tasks using Ansible.

## Directory Structure

```
ansible-repo/
├── inventory/                  # Directory to define different inventory files for environments
│   ├── production              # Inventory for production environment
│   ├── staging                 # Inventory for staging environment
│   └── development             # Inventory for development environment
├── playbooks/                  # Directory to store Ansible playbooks
│   ├── install_apache.yml      # Playbook to install Apache web server
│   ├── create_users.yml        # Playbook to create system users
│   ├── configure_firewall.yml  # Playbook to configure firewall settings
│   └── ...                     # Additional playbooks for other tasks
├── roles/                      # Directory to organize reusable role components
│   ├── apache/                 # Role to manage Apache configuration
│   │   ├── tasks/              # Directory for task definitions
│   │   │   └── main.yml        # Tasks to install and configure Apache
│   │   ├── handlers/           # Directory for event handlers
│   │   │   └── main.yml        # Handlers for tasks like restarting Apache
│   │   ├── templates/          # Directory for Jinja2 templates
│   │   │   └── index.html.j2   # Template file for Apache's index page
│   │   ├── files/              # Directory for static files to be deployed
│   │   └── defaults/           # Default variable definitions for the role
│   │       └── main.yml        # Default variables for Apache
│   ├── users/                  # Role to manage user creation and configuration
│   │   ├── tasks/              # Directory for task definitions
│   │   │   └── main.yml        # Tasks to create users and set permissions
│   │   └── defaults/           # Default variable definitions for the role
│   │       └── main.yml        # Default variables for users
│   └── webserver/              # Role to manage webserver configurations
│       ├── defaults/           # Default variables for the webserver role
│       ├── files/              # Files to be deployed
│       ├── handlers/           # Event handlers
│       ├── meta/               # Metadata for the role
│       ├── tasks/              # Tasks for the webserver role
│       ├── templates/          # Jinja2 templates for the webserver role
│       └── vars/               # Variables for the webserver role
├── group_vars/                 # Variables specific to groups of hosts
│   ├── all.yml                 # Variables applied to all hosts
│   ├── webservers.yml          # Variables for the webserver group
│   └── dbservers.yml           # Variables for the database server group
├── host_vars/                  # Variables specific to individual hosts
│   ├── web1.yml                # Variables for the host 'web1'
│   └── db1.yml                 # Variables for the host 'db1'
├── ansible.cfg                 # Ansible configuration file
└── README.md                   # Documentation for the repository
```

## Directory Descriptions

### `inventory/`
This directory contains files to define hosts and their groups for different environments such as production, staging, and development.
- To validate inventory, use the following command:
  ```bash
  ansible-inventory --list -i inventory/<environment>
  ```

### `playbooks/`
This directory stores Ansible playbooks for automating various tasks.
- To execute a playbook, use the following command:
  ```bash
  ansible-playbook playbooks/<playbook_name>.yml
  ```

### `roles/`
This directory organizes reusable configurations, tasks, handlers, templates, and more into roles.
- To create a new role, use the following command:
  ```bash
  ansible-galaxy init roles/<role_name>
  ```

### `group_vars/`
This directory stores variables that are scoped to a group of hosts.
- To add variables for a group, use the following command:
  ```bash
  echo "variable_name: value" > group_vars/<group_name>.yml
  ```

### `host_vars/`
This directory stores variables that are specific to individual hosts.
- To add variables for a host, use the following command:
  ```bash
  echo "variable_name: value" > host_vars/<host_name>.yml
  ```

### `ansible.cfg`
This is the Ansible configuration file that specifies settings such as the inventory, SSH keys, roles path, etc.
- To modify the configuration, you can edit the file using:
  ```bash
  nano ansible.cfg
  ```

## Setup and Usage

1. Clone this repository to your local machine.
2. Modify the `inventory/`, `group_vars/`, and `host_vars/` directories as per your environment setup.
3. Execute playbooks using the `ansible-playbook` command.
4. Create roles using the `ansible-galaxy init` command and customize them as per your requirements.

