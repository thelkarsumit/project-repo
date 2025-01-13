# Ansible Setup for SSH Key-based Authentication

This document outlines the steps required to set up Ansible with SSH key-based authentication for managing remote VMs. It includes the process for configuring both the Control VM (Ansible Server) and Managed VMs (Target Hosts) for secure connectivity.

## Summary

- Modify the `/etc/sudoers` file to include `username ALL=(ALL:ALL) NOPASSWD:ALL`.
- Generate an SSH key pair on the Control VM.
- Copy the public key (`ansible_key.pub`) to the `~/.ssh/authorized_keys` file on each Managed VM.
- Configure Ansible to use the private key (`ansible_key`) for SSH authentication.
- Modify the `sshd_config` file on both the Control VM and Managed VMs.
- Test the connection and then run the Ansible playbook.

## Where to Generate SSH Keys

You will generate the SSH key pair on the Control VM (the machine from which Ansible is run), and then use the public key to authenticate to the Managed VMs.

## Steps to Generate and Use the SSH Key

### 1. Generate the SSH Key Pair on the Control VM

- Open a terminal on the Control VM (where Ansible is running).
- Run the following command to generate an SSH key pair:

  ```bash
  ssh-keygen -t rsa -b 2048 -f ~/.ssh/ansible_key
  ```

  This will generate two files:
  - `~/.ssh/ansible_key` (private key)
  - `~/.ssh/ansible_key.pub` (public key)

  - You may choose to leave the passphrase empty or set one for added security.

### 2. Copy the Public Key to the Managed VMs (Target Hosts)

Now, you need to copy the public key (`~/.ssh/ansible_key.pub`) from the Control VM to the Managed VMs. There are two ways to do this:

#### Option 1: Using `ssh-copy-id`

If you can SSH into the Managed VMs manually (with password authentication), use `ssh-copy-id` to automatically add the public key to the `authorized_keys` file.

Run the following command from the Control VM:

```bash
ssh-copy-id -i ~/.ssh/ansible_key.pub user@managed_vm_ip
```

- Replace `user` with the actual username on the Managed VM (e.g., `ubuntu`, `ec2-user`).
- Replace `managed_vm_ip` with the actual IP address of the Managed VM.

#### Option 2: Manually Adding the Public Key

1. On the Control VM, view the public key:

   ```bash
   cat ~/.ssh/ansible_key.pub
   ```

   Copy the entire output (it should look like `ssh-rsa AAAAB3...`).

2. SSH into the Managed VM (using an existing method, like password authentication):

   ```bash
   ssh user@managed_vm_ip
   ```

3. On the **Managed VM**, open the `~/.ssh/authorized_keys` file (create it if it doesn't exist):

   ```bash
   nano ~/.ssh/authorized_keys
   ```

4. Paste the copied public key into this file and save it.

5. Make sure the file and directory permissions are correct on the Managed VM:

   ```bash
   chmod 700 ~/.ssh
   chmod 600 ~/.ssh/authorized_keys
   ```

### 3. Configure Ansible to Use the Private Key

Now that the public key is copied to the Managed VMs, you need to configure Ansible to use the private key (`~/.ssh/ansible_key`) when connecting.

#### Option 1: Specifying the Key in Ansible Playbook

You can specify the private key file directly in the playbook:

```yaml
---
- hosts: managed_vms
  tasks:
    - name: Example Task
      ansible.builtin.ping:
  vars:
    ansible_ssh_private_key_file: ~/.ssh/ansible_key
```

#### Option 2: Using `ansible.cfg`

If you don’t want to specify the key in every playbook, you can configure it globally in the `ansible.cfg` file:

```ini
[defaults]
private_key_file = ~/.ssh/ansible_key
```

This will ensure Ansible uses this private key for all playbooks.

#### Option 3: Using the `-i` Flag in the Command Line

Alternatively, when running Ansible commands, you can specify the private key like this:

```bash
ansible-playbook -i inventory.ini playbook.yml --private-key ~/.ssh/ansible_key
```

### 4. Test the SSH Connection

Before running your Ansible playbook, test the SSH connection from the Control VM to the Managed VMs:

```bash
ssh -i ~/.ssh/ansible_key user@managed_vm_ip
```

If everything is set up correctly, you should be able to SSH into the Managed VMs without being asked for a password.

### 5. Run the Ansible Playbook

Finally, you can run your Ansible playbook:

```bash
ansible-playbook -i inventory.ini playbook.yml
```

## Configuring SSH Daemon (`sshd_config`) on Both Control and Managed VMs

You need to make sure that SSH is properly configured to allow key-based authentication on both the Control VM and Managed VMs.

1. Open the `/etc/ssh/sshd_config` file on both VMs:

   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. Find these lines:

   ```bash
   #PubkeyAuthentication yes
   #AuthorizedKeysFile .ssh/authorized_keys
   ```

3. Remove the `#` at the beginning of these lines so they look like this:

   ```bash
   PubkeyAuthentication yes
   AuthorizedKeysFile .ssh/authorized_keys
   ```

4. Save the file and exit (press `Ctrl+X`, then press `Y`, and hit `Enter`).

5. After modifying the SSH configuration, restart the SSH service:

   ```bash
   sudo systemctl restart sshd
   ```

### Test the Connection Again

After making these changes, try the SSH connection again:

```bash
ssh -i ~/.ssh/ansible_key root@managed_vm_ip
```

If the connection still doesn't work, follow these additional steps:

1. Edit `/etc/ssh/sshd_config` and make password authentication enabled (`PasswordAuthentication yes`), then restart the SSH service.
2. Login on the Managed VM from the Control VM using the password.
3. Once logged in, disable password authentication again by editing `/etc/ssh/sshd_config` and setting `PasswordAuthentication no`, then restart SSH.

## Conclusion

Following these steps will configure your Ansible environment for SSH key-based authentication, ensuring secure and passwordless SSH access between your Control VM and Managed VMs.
```