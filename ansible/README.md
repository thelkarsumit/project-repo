ansible-repo/
├── inventory/                  # Directory to define diff inventory files for environments
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
│   └── ...                     # Additional roles for other components
├── group_vars/                 # Variables specific to groups of hosts
│   ├── all.yml                 # Variables applied to all hosts
│   ├── webservers.yml          # Variables for the webserver group
│   └── dbservers.yml           # Variables for the database server group
├── host_vars/                  # Variables specific to individual hosts
│   ├── web1.yml                # Variables for the host 'web1'
│   └── db1.yml                 # Variables for the host 'db1'
├── ansible.cfg                 # Ansible configuration file
└── README.md                   # Documentation for the repository


inventory/
Used to define hosts and their groups for different environments (e.g., production, staging, etc.).
Add using: ansible-inventory --list -i inventory/<environment> to validate inventory.

playbooks/
Contains playbooks for automating tasks.
Add using: ansible-playbook playbooks/<playbook_name>.yml to execute a playbook.

roles/
Organizes reusable configurations, tasks, handlers, templates, etc.
Add using: ansible-galaxy init roles/<role_name> to create a new role.

group_vars/
Stores variables scoped to a group of hosts.
Add using: echo "variable_name: value" > group_vars/<group_name>.yml.

host_vars/
Stores variables scoped to a specific host.
Add using: echo "variable_name: value" > host_vars/<host_name>.yml.

ansible.cfg
Configuration file for Ansible settings (e.g., inventory, SSH key, roles path).
Modify using: nano ansible.cfg or equivalent text editor.