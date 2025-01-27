# Installing and Configuring Active Directory

This chapter provides a detailed guide to install and configure Active Directory Domain Services (AD DS) on a Windows Server. 

---

## **1. Prerequisites for Installing Active Directory**
Before installing AD DS, ensure the following prerequisites are met:

1. **Operating System Requirements**:
   - Use Windows Server 2016, 2019, or later versions.
   - Ensure the server has the latest updates installed.

2. **Hardware Requirements**:
   - Minimum 2 GB RAM (recommend 4 GB for production).
   - At least 40 GB of free disk space.
   - Network connectivity to other domain controllers (if part of an existing domain).

3. **DNS Configuration**:
   - A properly configured DNS server is essential.
   - You can install the DNS role along with AD DS.

4. **Administrator Privileges**:
   - Log in as a user with administrative privileges on the server.

5. **Static IP Address**:
   - Assign a static IP to the server for consistency in communication.

---

## **2. Installing the Active Directory Domain Services Role**

### **Step-by-Step Installation**
1. **Open Server Manager**:
   - Press `Win + R`, type `ServerManager`, and hit `Enter`.

2. **Add Roles and Features**:
   - In Server Manager, click on **Manage** > **Add Roles and Features**.

3. **Role Installation Wizard**:
   - Select **Role-based or feature-based installation** and click **Next**.
   - Choose the target server and click **Next**.

4. **Select Server Roles**:
   - Check the box for **Active Directory Domain Services**.
   - When prompted, click **Add Features** to include additional tools (e.g., AD DS management tools).
   - Click **Next**.

5. **Install Required Features**:
   - Review the default selected features or add optional features as needed.
   - Click **Next**.

6. **Confirmation**:
   - Review your selections and click **Install**.

7. **Wait for Installation**:
   - Allow the installation process to complete. It may take a few minutes.

---

## **3. Configuring Active Directory**

### **Promote the Server to a Domain Controller**
After installing the AD DS role, you need to promote the server to a domain controller:

1. **Post-Deployment Configuration**:
   - In Server Manager, click the notification flag and select **Promote this server to a domain controller**.

2. **Deployment Configuration Options**:
   - Choose one of the following:
     - **Add a new forest**: If this is the first domain in a new environment.
     - **Add a domain to an existing forest**: To expand an existing forest.
     - **Add a new domain controller to an existing domain**: To add redundancy.
   - Enter the root domain name (e.g., `example.com`) if creating a new forest.

3. **Domain Controller Options**:
   - Specify the **Forest Functional Level** and **Domain Functional Level** (e.g., Windows Server 2016).
   - Select additional options like **Global Catalog (GC)** and **DNS Server**.
   - Set a **Directory Services Restore Mode (DSRM)** password for recovery scenarios.

4. **DNS Options**:
   - If DNS is installed, it will auto-configure. Review and confirm any warnings.

5. **Additional Options**:
   - Specify the **NetBIOS name** (auto-generated or custom) for the domain.

6. **Paths for Database, Logs, and SYSVOL**:
   - Use the default paths unless you have specific requirements:
     - Database folder: `C:\Windows\NTDS`
     - Log folder: `C:\Windows\NTDS`
     - SYSVOL folder: `C:\Windows\SYSVOL`

7. **Review and Validate**:
   - Review your configuration and click **Next**.
   - The wizard will perform prerequisite checks. Fix any errors or warnings if necessary.

8. **Install**:
   - Click **Install** to complete the configuration. The server will restart automatically upon completion.

---

## **4. Post-Installation Tasks**

1. **Verify Active Directory Installation**:
   - Open **Active Directory Users and Computers**:
     - Press `Win + R`, type `dsa.msc`, and hit **Enter**.
   - Ensure the domain name appears and default OUs like `Users`, `Computers`, and `Domain Controllers` are visible.

2. **Check DNS Configuration**:
   - Open **DNS Manager** (`dnsmgmt.msc`) and verify that DNS zones and records (e.g., `_msdcs`, `SRV`) are correctly created.

3. **Test Domain Join**:
   - Test by joining a client machine to the domain:
     - Go to **System Properties** > **Change Settings** > **Join Domain**.
     - Enter the domain name and credentials for a domain administrator.

4. **Enable Remote Administration** (Optional):
   - Enable Remote Server Administration Tools (RSAT) to manage AD remotely.

---

## **5. Useful PowerShell Commands**

Here are some PowerShell commands for installing and configuring AD DS:

### **Install AD DS Role**
```powershell
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
```

### **Promote the Server to a Domain Controller**
```powershell
Install-ADDSForest -DomainName "example.com" -CreateDNSDelegation:$false `
-DatabasePath "C:\Windows\NTDS" -LogPath "C:\Windows\NTDS" `
-SysvolPath "C:\Windows\SYSVOL" -Force -InstallDns
```

### **Check AD Status**
```powershell
Get-ADDomainController -Filter *
```

---

## **6. Troubleshooting Tips**

1. **Installation Errors**:
   - Check the **Event Viewer** for detailed error logs.
   - Ensure the server meets all prerequisites, including static IP and DNS configuration.

2. **DNS Issues**:
   - Run `ipconfig /all` to verify the DNS settings.
   - Use `dcdiag` to check for DNS-related errors.

3. **Replication Problems**:
   - Use the `repadmin /showrepl` command to verify replication between domain controllers.

---

## **Conclusion**

By completing this chapter, you now know how to install and configure Active Directory Domain Services on a Windows Server. You’ve also learned post-installation steps to verify and test the setup. Mastery of these steps is essential for building a stable and functional Active Directory environment.

---

This chapter provides **detailed, actionable steps** to install and configure AD, ensuring you won't need to refer to additional documents. Let me know if you'd like the next chapter or further clarifications!