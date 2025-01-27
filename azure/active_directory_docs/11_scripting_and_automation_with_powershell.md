Here’s a **detailed content outline** for the chapter **"Scripting and Automation with PowerShell"** to help you learn everything about using PowerShell for automating Active Directory tasks.

---

### **11_scripting_and_automation_with_powershell.md**

```markdown
# Scripting and Automation with PowerShell

## Introduction
PowerShell is a powerful scripting language and command-line shell built into Windows. It allows Active Directory administrators to automate repetitive tasks, manage users, groups, and permissions, and perform advanced configuration and troubleshooting. This chapter will guide you through key PowerShell cmdlets, scripts, and best practices for managing Active Directory.

---

## Table of Contents
1. [Why Use PowerShell for AD Automation?](#why-use-powershell-for-ad-automation)
2. [Getting Started with Active Directory Module](#getting-started-with-active-directory-module)
3. [Managing Users with PowerShell](#managing-users-with-powershell)
4. [Managing Groups with PowerShell](#managing-groups-with-powershell)
5. [Working with Organizational Units (OUs)](#working-with-organizational-units-ous)
6. [Automating Common AD Tasks](#automating-common-ad-tasks)
7. [Advanced PowerShell Scripting](#advanced-powershell-scripting)
8. [Best Practices for Scripting in AD](#best-practices-for-scripting-in-ad)

---

## 1. Why Use PowerShell for AD Automation?

- **Efficiency:** Automate repetitive tasks, saving time and reducing errors.
- **Flexibility:** Manage AD objects, permissions, and policies programmatically.
- **Scalability:** Perform bulk operations on users, groups, or computers.
- **Monitoring:** Query AD for real-time data about users, groups, and devices.

---

## 2. Getting Started with Active Directory Module

### Installing the AD Module
To work with Active Directory in PowerShell, install the **Active Directory module**:
```powershell
Install-WindowsFeature RSAT-AD-PowerShell
```

### Importing the AD Module
```powershell
Import-Module ActiveDirectory
```

### Verifying the Module
Check available cmdlets:
```powershell
Get-Command -Module ActiveDirectory
```

---

## 3. Managing Users with PowerShell

### Creating Users
```powershell
New-ADUser -Name "John Doe" -SamAccountName "jdoe" -UserPrincipalName "jdoe@domain.com" `
    -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "Password123!" -AsPlainText -Force) `
    -Enabled $true
```

### Modifying Users
```powershell
Set-ADUser -Identity "jdoe" -Title "IT Administrator" -Department "IT"
```

### Disabling/Enabling Users
```powershell
Disable-ADUser -Identity "jdoe"
Enable-ADUser -Identity "jdoe"
```

### Deleting Users
```powershell
Remove-ADUser -Identity "jdoe"
```

---

## 4. Managing Groups with PowerShell

### Creating Groups
```powershell
New-ADGroup -Name "IT Admins" -GroupScope Global -GroupCategory Security -Path "OU=Groups,DC=domain,DC=com"
```

### Adding Users to Groups
```powershell
Add-ADGroupMember -Identity "IT Admins" -Members "jdoe", "asmith"
```

### Removing Users from Groups
```powershell
Remove-ADGroupMember -Identity "IT Admins" -Members "jdoe"
```

### Viewing Group Membership
```powershell
Get-ADGroupMember -Identity "IT Admins"
```

---

## 5. Working with Organizational Units (OUs)

### Creating an OU
```powershell
New-ADOrganizationalUnit -Name "Finance Department" -Path "DC=domain,DC=com"
```

### Moving Objects Between OUs
```powershell
Move-ADObject -Identity "CN=John Doe,OU=Users,DC=domain,DC=com" `
    -TargetPath "OU=Finance Department,DC=domain,DC=com"
```

### Deleting an OU
```powershell
Remove-ADOrganizationalUnit -Identity "OU=Finance Department,DC=domain,DC=com"
```

---

## 6. Automating Common AD Tasks

### Bulk User Creation from CSV
**CSV Format:** `users.csv`
```csv
FirstName,LastName,SamAccountName,OU
John,Doe,jdoe,OU=Users,DC=domain,DC=com
Alice,Smith,asmith,OU=Users,DC=domain,DC=com
```

**PowerShell Script:**
```powershell
Import-Csv -Path "users.csv" | ForEach-Object {
    New-ADUser -Name "$($_.FirstName) $($_.LastName)" `
        -SamAccountName $_.SamAccountName -UserPrincipalName "$($_.SamAccountName)@domain.com" `
        -Path $_.OU -AccountPassword (ConvertTo-SecureString "Password123!" -AsPlainText -Force) `
        -Enabled $true
}
```

### Exporting User Data
```powershell
Get-ADUser -Filter * -Property DisplayName,Department,EmailAddress |
    Select-Object DisplayName,Department,EmailAddress |
    Export-Csv -Path "ADUsers.csv" -NoTypeInformation
```

### Resetting User Passwords
```powershell
Set-ADAccountPassword -Identity "jdoe" `
    -NewPassword (ConvertTo-SecureString "NewPassword123!" -AsPlainText -Force)
Unlock-ADAccount -Identity "jdoe"
```

---

## 7. Advanced PowerShell Scripting

### Querying AD with Filters
Find disabled accounts:
```powershell
Get-ADUser -Filter {Enabled -eq $false} | Select-Object Name,SamAccountName
```

Find locked-out accounts:
```powershell
Search-ADAccount -LockedOut | Select-Object Name,SamAccountName
```

### Managing Group Policies with PowerShell
Backup GPOs:
```powershell
Backup-GPO -Name "Default Domain Policy" -Path "C:\GPOBackups"
```

Restore GPOs:
```powershell
Restore-GPO -Name "Default Domain Policy" -Path "C:\GPOBackups"
```

---

## 8. Best Practices for Scripting in AD

- **Test in a Lab Environment:** Always test scripts in a non-production environment.  
- **Use Comments:** Add comments to explain the purpose of each script.  
- **Error Handling:** Implement `try` and `catch` blocks to handle errors.  
- **Use Logging:** Write logs to a file for auditing and troubleshooting.  
- **Secure Passwords:** Avoid hardcoding passwords; use `Get-Credential` or secure methods.  

---

## Conclusion
PowerShell is a vital tool for any Active Directory administrator, enabling automation, efficiency, and scalability. By mastering these commands and scripting techniques, you'll significantly reduce manual effort and improve accuracy in managing your AD environment.
```

---

### Next Steps:
Let me know if you'd like to start working on the **next chapter** or expand on any specific section in this one!