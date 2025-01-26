# Backup and Recovery in Active Directory

## Introduction
Backing up and recovering Active Directory (AD) is critical for maintaining the availability and integrity of your directory services. This chapter covers how to properly back up and restore AD, including strategies to recover deleted objects and disaster recovery best practices.

---

## 1. Why Backup and Recovery is Important
Active Directory stores critical data that ensures the functionality of your IT infrastructure, such as:
- User accounts, groups, and security permissions
- Domain controller configurations
- Group Policy Objects (GPOs)
- DNS configurations
- Replication topology

Losing this data can disrupt authentication, authorization, and other vital services, making a robust backup and recovery plan essential.

---

## 2. Types of Active Directory Backups
Active Directory backups are typically performed at the **system state level**. Below are the types of backups relevant to AD:

### 2.1 Full Backup
- Includes system state data along with all volumes, files, and application data.
- Suitable for disaster recovery scenarios where the entire server needs to be restored.

### 2.2 System State Backup
- Captures the critical components of Active Directory:
  - AD database (NTDS.dit)
  - SYSVOL folder (Group Policy templates and scripts)
  - Registry
  - Boot files
  - COM+ class registration database
- Ideal for restoring Active Directory configurations without affecting other server data.

---

## 3. Tools for Backup and Recovery
Below are tools commonly used for AD backups:

### 3.1 Windows Server Backup (WSB)
- A built-in tool available on Windows Server to back up system state.
- Suitable for small to medium-scale environments.

### 3.2 Third-Party Backup Solutions
- Tools like **Veeam**, **Commvault**, and **Veritas NetBackup** offer advanced features such as incremental backups and centralized management.
- Useful for large-scale enterprise environments.

### 3.3 Command-Line Tools
- **wbadmin**: Command-line utility to manage Windows Server Backup.
- **ntdsutil**: Advanced tool for managing AD backups and restores.

---

## 4. Backing Up Active Directory
### 4.1 Prerequisites for Backing Up AD
1. Ensure the **Windows Server Backup** feature is installed:
   ```powershell
   Install-WindowsFeature Windows-Server-Backup
   ```
2. The account performing the backup must have **Backup Operator** or **Administrator** privileges.

### 4.2 Steps to Perform a System State Backup
1. Open **Windows Server Backup** from Server Manager.
2. Select **Backup Once** or configure a **Scheduled Backup**.
3. Choose **Custom Backup Configuration**.
4. Include **System State** in the items to back up.
5. Select the backup destination (local disk or network share).
6. Start the backup.

Alternatively, use **wbadmin**:
```powershell
wbadmin start systemstatebackup -backupTarget:D: -quiet
```

---

## 5. Restoring Active Directory
There are two types of AD restores: **Authoritative** and **Non-Authoritative**.

### 5.1 Non-Authoritative Restore
- Restores AD to its most recent backed-up state.
- Changes from other domain controllers are replicated back to the restored domain controller.
- Suitable for recovering a failed domain controller.

#### Steps for Non-Authoritative Restore:
1. Boot the server into **Directory Services Restore Mode (DSRM)**:
   - Restart the server and press **F8** during boot.
   - Select **Directory Services Restore Mode**.
2. Log in using the **DSRM Administrator Password**.
3. Open Command Prompt and use **wbadmin** to restore the system state:
   ```powershell
   wbadmin start systemstaterecovery -version:<backup version> -quiet
   ```
4. Restart the server to apply changes.

---

### 5.2 Authoritative Restore
- Marks specific objects (or entire AD database) as authoritative.
- Useful for recovering deleted objects like user accounts or OUs.

#### Steps for Authoritative Restore:
1. Perform a **Non-Authoritative Restore** first (see steps above).
2. Open Command Prompt and run **ntdsutil**:
   ```powershell
   ntdsutil
   activate instance ntds
   authoritative restore
   ```
3. Mark specific objects as authoritative:
   ```powershell
   restore object "CN=John Doe,OU=Users,DC=domain,DC=com"
   ```
   Or restore an entire OU:
   ```powershell
   restore subtree "OU=HR,DC=domain,DC=com"
   ```
4. Exit and restart the domain controller.

---

## 6. Recovering Deleted Objects with AD Recycle Bin
The **Active Directory Recycle Bin** provides a simpler way to recover deleted objects.

### 6.1 Enabling the AD Recycle Bin
1. Open **Active Directory Administrative Center**.
2. Navigate to your domain.
3. Click **Enable Recycle Bin** under Tasks.

### 6.2 Restoring Deleted Objects
1. Open **Active Directory Administrative Center**.
2. Navigate to **Deleted Objects** under your domain.
3. Right-click the object you want to restore and select **Restore** or **Restore To**.

---

## 7. Disaster Recovery Best Practices
1. **Regular Backups**:
   - Schedule daily or weekly system state backups.
   - Test backup integrity regularly.
2. **Redundancy**:
   - Use multiple domain controllers to avoid single points of failure.
3. **Document Recovery Procedures**:
   - Maintain updated documentation for backup and recovery steps.
4. **Periodic Testing**:
   - Perform test restores in a lab environment to validate your recovery process.
5. **Secure Backups**:
   - Store backups in secure locations and encrypt them.

---

## 8. Conclusion
Backup and recovery are fundamental to maintaining a robust Active Directory environment. By using proper tools, understanding different restore methods, and following best practices, you can ensure business continuity and reduce downtime in the event of a disaster.
```

---

### **Next Steps**
Would you like to continue with another chapter, or do you want further elaboration (e.g., screenshots, more examples, or additional tools)? Let me know!