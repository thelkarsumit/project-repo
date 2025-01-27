# AD Security and Permissions 


### **Overview**
Active Directory (AD) security is critical for protecting organizational resources and ensuring only authorized users have access to data and systems. This chapter covers the essentials of securing AD objects, managing permissions, and implementing role-based access control (RBAC). 

---

### **Contents**

1. **Introduction to Security in AD**  
   - Why securing AD is important.  
   - Common vulnerabilities and attack vectors (e.g., privilege escalation, Kerberos attacks).  

2. **Permissions in Active Directory**  
   - Types of permissions in AD (Basic and Advanced).  
   - Default permissions on objects (Users, Groups, OUs, etc.).  
   - Understanding **Access Control Lists (ACLs)** and **Access Control Entries (ACEs)**.  

3. **Role-Based Access Control (RBAC)**  
   - What is RBAC, and why it’s effective.  
   - Defining roles and assigning them to groups.  
   - Examples of common roles (e.g., Helpdesk Admin, Group Manager).

4. **Managing Object Permissions**  
   - Assigning permissions to AD objects using the GUI.  
   - Managing permissions via PowerShell.  

5. **Securing Sensitive AD Objects**  
   - Protecting critical AD groups (e.g., Domain Admins, Enterprise Admins).  
   - Using **Protected Users Group** and **AdminSDHolder**.  
   - Preventing accidental deletion of critical objects.  

6. **Auditing and Monitoring Permissions**  
   - Enabling auditing for AD object access.  
   - Tracking changes to permissions and monitoring activity.  
   - Tools for auditing (e.g., Event Viewer, PowerShell, third-party tools).  

7. **Best Practices for AD Security and Permissions**  
   - Least privilege principle.  
   - Regularly reviewing permissions.  
   - Securing default accounts.  

---

### **Detailed Content**

#### **1. Introduction to Security in AD**
- Active Directory is often the primary target for attackers because it controls access to organizational resources.  
- Common attacks include:  
  - Pass-the-Hash and Pass-the-Ticket.  
  - Kerberos Golden Ticket attacks.  
  - Exploiting weak or misconfigured permissions.  

#### **2. Permissions in Active Directory**
- **Basic Permissions:**  
  - Full Control, Read, Write, Modify.  
- **Advanced Permissions:**  
  - Create Child Objects, Delete Child Objects, Modify Permissions, etc.  

**Access Control Lists (ACLs):**
- Every AD object has an **ACL** that specifies which users or groups can access it and what actions they can perform.  

**Access Control Entries (ACEs):**
- An ACL is made up of ACEs. Each ACE specifies the permissions for a particular user or group.  

---

#### **3. Role-Based Access Control (RBAC)**
RBAC simplifies permission management by assigning permissions to roles rather than individual users.  

**Steps to Implement RBAC:**  
1. Identify roles (e.g., Helpdesk Admin, Group Admin).  
2. Create AD groups corresponding to each role.  
3. Assign permissions to these groups.  
4. Add users to the appropriate groups.  

---

#### **4. Managing Object Permissions**
**Using the GUI:**  
1. Open **Active Directory Users and Computers**.  
2. Right-click an object (e.g., user, group, or OU) and select **Properties**.  
3. Go to the **Security** tab and click **Advanced**.  
4. Add or remove permissions as needed.  

**Using PowerShell:**  
To view permissions:  
```powershell
Get-ACL "AD:\OU=Finance,DC=example,DC=com" | Format-List
```

To set permissions:  
```powershell
$acl = Get-ACL "AD:\OU=Finance,DC=example,DC=com"
$rule = New-Object System.DirectoryServices.ActiveDirectoryAccessRule(
    "DOMAIN\UserAccount", 
    "Read, Write", 
    "Allow"
)
$acl.AddAccessRule($rule)
Set-ACL "AD:\OU=Finance,DC=example,DC=com" -AclObject $acl
```

---

#### **5. Securing Sensitive AD Objects**
- Protect high-privilege groups (e.g., Domain Admins, Enterprise Admins) by enabling **AdminSDHolder** to enforce permissions.  
- Use the **Protected Users** group to prevent credential theft.  
- Enable the **Account Lockout Policy** to prevent brute force attacks.  

**Prevent Accidental Deletions:**  
- Enable the **"Protect object from accidental deletion"** option in the object’s properties.  

---

#### **6. Auditing and Monitoring Permissions**
**Enable Auditing for AD Objects:**  
1. Open Group Policy Management.  
2. Edit the Default Domain Controllers Policy.  
3. Go to **Computer Configuration > Policies > Windows Settings > Security Settings > Local Policies > Audit Policy**.  
4. Enable the **Audit Directory Service Access** policy.  

**View Audited Events:**  
- Open **Event Viewer** and navigate to **Security Logs**. Look for Event ID **4662** for AD object access.  

**Third-Party Tools for Auditing:**  
- SolarWinds Access Rights Manager.  
- Netwrix Auditor for Active Directory.  

---

#### **7. Best Practices for AD Security and Permissions**
1. **Follow the Least Privilege Principle:**  
   Assign users only the permissions they need to perform their tasks.  
2. **Secure Default Accounts:**  
   Rename the default Administrator account and disable the Guest account.  
3. **Regularly Audit Permissions:**  
   Review ACLs periodically to ensure permissions are correct and no excessive rights are granted.  
4. **Use Groups Over Individual Assignments:**  
   Assign permissions to groups rather than individual users.  
5. **Implement Tiered Administration:**  
   Use tiered administrative models to separate high-privilege and low-privilege tasks.  

---

### **Conclusion**
Securing Active Directory is an ongoing process that requires understanding permissions, implementing robust access controls, and regularly monitoring and auditing the environment. By following best practices and leveraging tools like PowerShell, admins can effectively manage and secure their AD infrastructure.

---
