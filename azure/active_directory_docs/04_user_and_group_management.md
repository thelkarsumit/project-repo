# User and Group Management in Active Directory

Managing users and groups is a fundamental task for any Active Directory (AD) administrator. This chapter provides a comprehensive guide to creating, managing, and automating user accounts and groups.

---

## Table of Contents

1. [Understanding Users and Groups](#1-understanding-users-and-groups)
2. [Creating Users](#2-creating-users)
   - Using GUI
   - Using PowerShell
3. [Managing Users](#3-managing-users)
   - Modifying User Properties
   - Enabling/Disabling Users
   - Deleting Users
4. [Creating and Managing Groups](#4-creating-and-managing-groups)
   - Types of Groups
   - Creating Groups (GUI/PowerShell)
   - Adding Members to Groups
5. [Special Built-in Groups](#5-special-built-in-groups)
   - Administrators, Domain Users, etc.
6. [User and Group Automation with PowerShell](#6-user-and-group-automation-with-powershell)
7. [Best Practices for User and Group Management](#7-best-practices-for-user-and-group-management)

---

## 1. Understanding Users and Groups

- **Users**: Represent individual accounts that can log into the domain and access resources.
  - Example: `John.Doe` or `AdminUser`.
- **Groups**: Collections of users or other groups that are used to assign permissions.
  - Example: `HR_Group`, `Finance_Group`.

### Why Use Groups?
- Simplifies permission management by assigning permissions to groups instead of individual users.
- Reduces administrative overhead.

---

## 2. Creating Users

### a. Using the GUI
1. Open **Active Directory Users and Computers (ADUC)**:
   - Run `dsa.msc` in the **Run** dialog (Win + R).
2. Navigate to the desired **Organizational Unit (OU)**.
3. Right-click the OU → Select **New** → **User**.
4. Fill in the following details:
   - **First Name**, **Last Name**
   - **User Logon Name** (e.g., John.Doe)
   - Set a password.
5. Click **Finish** to create the user.

---

### b. Using PowerShell

To create a new user:
```powershell
New-ADUser -Name "John Doe" -GivenName "John" -Surname "Doe" -SamAccountName "John.Doe" -UserPrincipalName "John.Doe@domain.com" -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) -Enabled $true
```

Explanation of key parameters:
- `-Name`: Display name of the user.
- `-SamAccountName`: User's login name.
- `-UserPrincipalName`: Email-style login name.
- `-Path`: The OU where the user will be created.
- `-AccountPassword`: Sets the user's password.
- `-Enabled`: Enables the account.

---

## 3. Managing Users

### a. Modifying User Properties
1. **GUI**:
   - Right-click the user → Select **Properties**.
   - Edit attributes like email, phone number, department, etc.

2. **PowerShell**:
   Update a user’s properties:
   ```powershell
   Set-ADUser -Identity "John.Doe" -EmailAddress "John.Doe@domain.com" -Title "HR Manager" -Department "HR"
   ```

### b. Enabling or Disabling Users
- **GUI**: Right-click user → Select **Disable Account** or **Enable Account**.
- **PowerShell**:
  - Disable:
    ```powershell
    Disable-ADAccount -Identity "John.Doe"
    ```
  - Enable:
    ```powershell
    Enable-ADAccount -Identity "John.Doe"
    ```

### c. Deleting Users
- **GUI**: Right-click user → Select **Delete**.
- **PowerShell**:
  ```powershell
  Remove-ADUser -Identity "John.Doe"
  ```

---

## 4. Creating and Managing Groups

### a. Types of Groups
- **Security Groups**: Used to assign permissions.
- **Distribution Groups**: Used for email distribution lists.

### b. Creating Groups

#### GUI Method:
1. Open **ADUC**.
2. Navigate to the desired OU.
3. Right-click the OU → Select **New** → **Group**.
4. Specify:
   - Group Name
   - Group Scope (Global, Universal, or Domain Local)
   - Group Type (Security or Distribution).

#### PowerShell Method:
```powershell
New-ADGroup -Name "HR_Group" -GroupScope Global -GroupCategory Security -Path "OU=Groups,DC=domain,DC=com"
```

### c. Adding Members to Groups
- **GUI**:
  1. Right-click the group → Select **Properties**.
  2. Go to the **Members** tab → Add users.

- **PowerShell**:
  ```powershell
  Add-ADGroupMember -Identity "HR_Group" -Members "John.Doe", "Jane.Doe"
  ```

---

## 5. Special Built-in Groups

| Group Name         | Description                                     |
|--------------------|-------------------------------------------------|
| **Administrators** | Full control over the domain.                   |
| **Domain Users**   | Contains all users by default.                  |
| **Account Operators** | Manages user accounts and groups.           |

---

## 6. User and Group Automation with PowerShell

### Bulk User Creation
Create multiple users from a CSV file:
1. **CSV Example (users.csv)**:
   ```csv
   FirstName,LastName,UserPrincipalName,Password
   John,Doe,John.Doe@domain.com,P@ssw0rd
   Jane,Doe,Jane.Doe@domain.com,P@ssw0rd
   ```

2. **PowerShell Script**:
   ```powershell
   Import-Csv -Path "users.csv" | ForEach-Object {
       New-ADUser -Name "$($_.FirstName) $($_.LastName)" -GivenName $_.FirstName -Surname $_.LastName -UserPrincipalName $_.UserPrincipalName -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force) -Enabled $true
   }
   ```

---

## 7. Best Practices for User and Group Management

1. **Use Groups for Permissions**: Always assign permissions to groups, not individual users.
2. **Organize with OUs**: Place users and groups in Organizational Units based on function, department, or location.
3. **Strong Password Policies**: Enforce password complexity and expiration policies.
4. **Audit Regularly**: Use AD auditing tools to monitor user and group changes.
5. **Automate Repetitive Tasks**: Use PowerShell scripts to streamline user and group management.

---

## Conclusion

Managing users and groups effectively is crucial for maintaining a secure and efficient Active Directory environment. By mastering GUI tools and PowerShell, administrators can handle tasks efficiently and enforce best practices.

---
