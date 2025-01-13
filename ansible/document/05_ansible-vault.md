Certainly! Here's a well-structured and concise document about **Ansible Vault** and its commands that you can save for future reference.

---

## **Ansible Vault: Managing Sensitive Data Securely**

**Ansible Vault** is a tool that allows you to encrypt and decrypt sensitive data within Ansible playbooks, variable files, or any other artifact. It is designed to protect secrets like passwords, API keys, certificates, and other sensitive information while still being usable in your automation processes.

### **Why Use Ansible Vault?**

- **Security**: Vault ensures sensitive information (passwords, keys, etc.) is encrypted and not exposed in plaintext.
- **Easy Integration**: Vault integrates seamlessly into Ansible playbooks, allowing secure management of sensitive data across teams and environments.
- **Flexibility**: Vault allows you to encrypt entire files or individual strings.
- **Version Control Safe**: Store encrypted files in version control repositories without exposing secrets.

---

### **Common Ansible Vault Commands**

#### 1. **Encrypting Files or Variables**

- **Encrypt a file**: Encrypt an entire file that contains sensitive information.
  ```bash
  ansible-vault encrypt <filename>
  ```
  Example:
  ```bash
  ansible-vault encrypt secrets.yml
  ```

- **Encrypt a string**: Encrypt a single variable value to use directly in playbooks.
  ```bash
  ansible-vault encrypt_string '<plaintext-string>' --name '<variable-name>'
  ```
  Example:
  ```bash
  ansible-vault encrypt_string 'mysecretpassword' --name 'db_password'
  ```

#### 2. **Decrypting Files**

- **Decrypt a file**: Decrypt a previously encrypted file.
  ```bash
  ansible-vault decrypt <filename>
  ```
  Example:
  ```bash
  ansible-vault decrypt secrets.yml
  ```

- **View an encrypted file**: Show the content of an encrypted file without modifying it.
  ```bash
  ansible-vault view <filename>
  ```
  Example:
  ```bash
  ansible-vault view secrets.yml
  ```

#### 3. **Editing Encrypted Files**

- **Edit an encrypted file**: Open an encrypted file for editing. Ansible will decrypt it temporarily, and upon saving, it will be re-encrypted.
  ```bash
  ansible-vault edit <filename>
  ```
  Example:
  ```bash
  ansible-vault edit secrets.yml
  ```

#### 4. **Changing the Encryption Password (Re-keying)**

- **Re-key a file**: Change the password used to encrypt a file.
  ```bash
  ansible-vault rekey <filename>
  ```
  Example:
  ```bash
  ansible-vault rekey secrets.yml
  ```

#### 5. **Running Playbooks with Vault Passwords**

- **Specify a vault password file**: Supply the Vault password from a file to avoid manual input during playbook execution.
  ```bash
  ansible-playbook playbook.yml --vault-password-file <password-file>
  ```
  Example:
  ```bash
  ansible-playbook playbook.yml --vault-password-file ~/.vault_pass.txt
  ```

- **Prompt for the vault password**: Use `--ask-vault-pass` to prompt for the password interactively.
  ```bash
  ansible-playbook playbook.yml --ask-vault-pass
  ```

#### 6. **Multiple Vault Passwords**

- **Use multiple vault passwords**: Specify different Vault IDs for files that use different passwords.
  ```bash
  ansible-playbook playbook.yml --vault-id dev@prompt --vault-id prod@~/prod_vault_pass.txt
  ```
  In this example:
  - `dev@prompt` prompts for the Vault password.
  - `prod@~/prod_vault_pass.txt` uses a password from a file.

#### 7. **Vault Status**

- **Check if a file is encrypted**: Use this command to verify whether a file is encrypted.
  ```bash
  ansible-vault status <filename>
  ```
  Example:
  ```bash
  ansible-vault status secrets.yml
  ```

#### 8. **Displaying Vault Version**

- **Check Vault version**: Display the version of Ansible Vault used to encrypt a file.
  ```bash
  ansible-vault version
  ```

---

### **Managing Encrypted Files in Playbooks**

- **Merging Encrypted and Regular Variables**: You can use both encrypted files and non-encrypted variables in the same playbook by referencing the encrypted file under `vars_files`.

**Example**:
```yaml
---
- name: Example playbook using both encrypted and regular variables
  hosts: localhost
  vars_files:
    - secrets.yml  # Encrypted file
  vars:
    db_host: localhost  # Regular variable

  tasks:
    - name: Show DB password and host
      debug:
        msg: "DB Password: {{ db_password }}, DB Host: {{ db_host }}"
```

---

### **Best Practices for Using Ansible Vault**

- **Secure Vault Passwords**: Store Vault passwords in a secure manner (e.g., use environment variables or password files that are not version-controlled).
- **Minimal Privilege**: Only grant access to encrypted files and passwords to those who absolutely need it.
- **Use Vault with Source Control**: You can safely store encrypted files in version control systems without exposing sensitive data.
- **Use Strong Passwords**: Ensure your Vault password is strong, as it secures all your sensitive data.
- **Automate Password Management**: For automation, use `--vault-password-file` or environment variables to manage passwords instead of manual input.

---

### **Summary of Common `ansible-vault` Commands**

| **Command**                         | **Description**                                     |
|-------------------------------------|-----------------------------------------------------|
| `ansible-vault encrypt <file>`      | Encrypt an entire file.                            |
| `ansible-vault encrypt_string`      | Encrypt a single string variable.                  |
| `ansible-vault decrypt <file>`      | Decrypt a file to view or modify.                  |
| `ansible-vault view <file>`         | View the contents of an encrypted file.            |
| `ansible-vault edit <file>`         | Edit an encrypted file securely.                   |
| `ansible-vault rekey <file>`        | Change the encryption password for a file.         |
| `ansible-playbook <playbook.yml> --vault-password-file <file>` | Run a playbook with a vault password file.         |
| `ansible-vault status <file>`       | Check if a file is encrypted.                      |
| `ansible-vault version`             | Display the Vault version.                         |
| `ansible-playbook <playbook.yml> --vault-id <id@password-file>` | Use multiple vault passwords in a playbook. |

---

By following these guidelines and using the commands outlined above, you can securely manage sensitive data in your Ansible workflows, ensuring that your automation processes remain safe and confidential.

---

This document can now serve as a reference for managing sensitive data securely using **Ansible Vault**.