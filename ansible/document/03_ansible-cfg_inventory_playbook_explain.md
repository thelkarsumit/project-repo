# Ansible Configuration and Playbook Setup

This repository contains Ansible configurations, inventory, and playbooks to automate the setup of web servers. Below is an explanation of each file and their respective roles.

## Explanation of Each File:

### 1. `ansible.cfg`:
   - Defines the default inventory file path, user, and SSH configurations.
   - Simplifies running playbooks without specifying options repeatedly.

### 2. `inventory_file`:
   - Maps groups like `webservers` to specific hosts.
   - Includes connection details such as IP, user, and SSH key.

### 3. `setup_webserver.yml`:
   - Automates installation and configuration of nginx.
   - Ensures nginx is running and persists across reboots.
   - Configures the firewall to allow HTTP traffic.

---

## Ansible Configuration Overview (`ansible.cfg` file)

The `ansible.cfg` file is used to configure Ansible behavior globally or for specific projects. In this file, we can set default inventory paths, SSH configurations, retries, and other settings.

Example `ansible.cfg` File:

```ini
[defaults]
inventory = inventory_file  # Specifies the default inventory file path.
remote_user = ubuntu        # Default remote user for SSH.
host_key_checking = False   # Disable SSH key host checking.
log_path = ansible.log      # Log output to ansible.log.
retry_files_enabled = False # Disable creation of retry files.

[privilege_escalation]
become = True               # Enable privilege escalation (sudo).
become_method = sudo        # Use sudo for privilege escalation.
become_user = root          # Default user to escalate privileges to.
```

Save this file in the same directory as the playbook or at `/etc/ansible/ansible.cfg` for global settings.

### Project-Specific `ansible.cfg` Setup

If you are not saving it to the global folder, follow these steps to configure the `ansible.cfg` in your project directory:

#### Steps to Use `ansible.cfg` in Project Directory:

1. **Place `ansible.cfg` in the Project Directory:**
   - Based on your folder structure, the `ansible.cfg` file is located at `project-repo/ansible/ansible.cfg`.

2. **Configure `ansible.cfg`:**
   - Edit the `ansible.cfg` file to match your project requirements. For example:

   ```ini
   [defaults]
   inventory      = ./inventory/development  # Default inventory file
   remote_user    = your-username            # Default SSH user
   host_key_checking = False                 # Disable host key checking
   log_path       = ./ansible.log            # Log file in the project directory
   ```

3. **Run Ansible Commands from the Project Directory:**
   - When running any Ansible command, ensure your current working directory is `project-repo/ansible/ansible.cfg`.

   ```bash
   cd project-repo/ansible/ansible.cfg
   ansible-playbook playbooks/install_apache.yml
   ```

4. **Verify Configuration File is Detected:**
   - Run the following command to confirm Ansible is using the correct configuration file:

   ```bash
   ansible --version
   ```

#### Additional Tips:

1. **Environment Variable (Optional):**
   If you often run Ansible commands from different directories, set the `ANSIBLE_CONFIG` environment variable to explicitly point to your project-specific `ansible.cfg`.

   ```bash
   export ANSIBLE_CONFIG=project-repo/ansible/ansible.cfg
   ```

2. **Inventory Management:**
   You can dynamically switch between `development`, `staging`, and `production` inventories by specifying them in the `ansible.cfg` file or directly in the `ansible-playbook` command:

   ```bash
   ansible-playbook -i inventory/production playbooks/install_apache.yml
   ```

With this setup, you can manage everything within your Git repository without relying on `/etc/ansible/`.

---

## Inventory File

The inventory file lists the hosts and groups for your Ansible playbooks.

Example `inventory_file`:

```ini
[allhosts]
web1.example.com ansible_host=External_ip_server ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/key.pem
web2.example.com ansible_host=External_ip_server ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/key.pem

[webservers1]
web1.example.com ansible_host=External_ip_server ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/key.pem

[webservers2]
web2.example.com ansible_host=External_ip_server ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/key.pem
```

---

## Playbook File (`setup_webserver.yml`)

This YAML file defines the tasks to be performed on the target servers.

Example `setup_webserver.yml`:

```yaml
---
- name: Set up web server
  hosts: allhosts
  become: true
  tasks:
    - name: Update APT package list
      apt:
        update_cache: yes

    - name: Install nginx
      apt:
        name: nginx
        state: present

    - name: Start and enable nginx
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Allow HTTP traffic through the firewall
      ufw:
        rule: allow
        port: 80
        proto: tcp
```

### Running the Playbook

1. If you have a custom inventory file path specified in `ansible.cfg`, run the playbook with the following command:

   ```bash
   ansible-playbook setup_webserver.yml
   ```

2. If you want to specify a custom inventory file directly, run:

   ```bash
   ansible-playbook -i custom_inventory_file_path setup_webserver.yml
   ```

---

## Testing SSH Connection via Ansible:

Run a simple SSH test using Ansible to verify connectivity:

```bash
ansible -i inventory all -m ping
```

---


