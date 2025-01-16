# Active Directory Basics Using PowerShell

## Introduction to Active Directory (AD)
Active Directory (AD) is a directory service developed by Microsoft for Windows domain networks. It manages and organizes network resources like users, computers, and groups, enabling centralized management and security.

PowerShell, with the `ActiveDirectory` module, is a powerful tool to automate and manage AD tasks efficiently. This document provides a comprehensive guide to understanding and using PowerShell for basic AD management.

---

## Prerequisites

1. **Required Tools**:
   - PowerShell (preferably version 5.1 or later).
   - RSAT (Remote Server Administration Tools) installed on your system.

2. **Import the Active Directory Module**:
   Use the following command to import the `ActiveDirectory` module:
   ```powershell
   Import-Module ActiveDirectory
   ```

3. **Permissions**:
   Ensure you have appropriate permissions to perform AD operations (e.g., Domain Admin or specific delegation).

---

## Common Active Directory Cmdlets

Here are some frequently used PowerShell cmdlets for AD management:

| Cmdlet                | Description                                    |
|-----------------------|------------------------------------------------|
| `Get-ADUser`         | Retrieves information about AD users.          |
| `New-ADUser`         | Creates a new AD user.                         |
| `Set-ADUser`         | Modifies properties of an AD user.             |
| `Remove-ADUser`      | Deletes an AD user.                            |
| `Get-ADGroup`        | Retrieves information about AD groups.         |
| `New-ADGroup`        | Creates a new AD group.                        |
| `Add-ADGroupMember`  | Adds users to a group.                         |
| `Remove-ADGroupMember` | Removes users from a group.                   |
| `Get-ADComputer`     | Retrieves information about AD computers.      |
| `New-ADOrganizationalUnit` | Creates a new organizational unit (OU). |

---

## Common Active Directory Tasks Using PowerShell

### 1. Querying Active Directory

#### Retrieve All Users:
```powershell
Get-ADUser -Filter *
```
#### Retrieve Specific User by Name:
```powershell
Get-ADUser -Identity "John.Doe"
```
#### Retrieve Users from a Specific Organizational Unit (OU):
```powershell
Get-ADUser -Filter * -SearchBase "OU=Users,DC=domain,DC=com"
```
#### Retrieve Selected Properties:
```powershell
Get-ADUser -Filter * -Property DisplayName, EmailAddress
```

### 2. Managing Users

#### Create a New User:
```powershell
New-ADUser -Name "Jane Doe" -SamAccountName "jdoe" -UserPrincipalName "jdoe@domain.com" `
-Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
-Enabled $true
```

#### Modify User Properties:
```powershell
Set-ADUser -Identity "jdoe" -Title "Software Engineer" -Department "IT"
```

#### Disable a User Account:
```powershell
Disable-ADAccount -Identity "jdoe"
```

#### Enable a User Account:
```powershell
Enable-ADAccount -Identity "jdoe"
```

#### Delete a User:
```powershell
Remove-ADUser -Identity "jdoe"
```

### 3. Managing Groups

#### Create a New Group:
```powershell
New-ADGroup -Name "IT Admins" -SamAccountName "ITAdmins" -GroupCategory Security -GroupScope Global -Path "OU=Groups,DC=domain,DC=com"
```

#### Add Users to a Group:
```powershell
Add-ADGroupMember -Identity "IT Admins" -Members "jdoe", "adoe"
```

#### Remove Users from a Group:
```powershell
Remove-ADGroupMember -Identity "IT Admins" -Members "jdoe" -Confirm:$false
```

#### Get Group Members:
```powershell
Get-ADGroupMember -Identity "IT Admins"
```

### 4. Managing Organizational Units (OUs)

#### Create a New OU:
```powershell
New-ADOrganizationalUnit -Name "TestOU" -Path "DC=domain,DC=com"
```

#### Move an Object to Another OU:
```powershell
Move-ADObject -Identity "CN=Jane Doe,OU=Users,DC=domain,DC=com" -TargetPath "OU=TestOU,DC=domain,DC=com"
```

### 5. Searching with Filters

#### Find Disabled User Accounts:
```powershell
Get-ADUser -Filter {Enabled -eq $false} -Properties Enabled
```

#### Find Users with a Specific Job Title:
```powershell
Get-ADUser -Filter {Title -eq "Software Engineer"}
```

#### Find Users Without Email Addresses:
```powershell
Get-ADUser -Filter * -Properties EmailAddress | Where-Object { $_.EmailAddress -eq $null }
```

---

## Tips for Effective AD Management

1. **Always Test Scripts**:
   Use `-WhatIf` to preview changes without applying them:
   ```powershell
   Remove-ADUser -Identity "jdoe" -WhatIf
   ```

2. **Use Logs**:
   Log actions to a file for auditing purposes:
   ```powershell
   Start-Transcript -Path "C:\Logs\ADManagement.log"
   # PowerShell commands
   Stop-Transcript
   ```

3. **Secure Credentials**:
   Avoid hardcoding passwords; use secure methods like:
   ```powershell
   $SecurePassword = Read-Host "Enter Password" -AsSecureString
   ```

4. **Documentation**:
   Maintain clear and up-to-date documentation for all scripts and changes.

---

