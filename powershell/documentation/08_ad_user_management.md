# Active Directory User Management with PowerShell

Managing users in Active Directory (AD) is a core administrative task. PowerShell provides powerful cmdlets for creating, modifying, querying, and removing users efficiently. This document explains key concepts, commands, and examples for comprehensive AD user management.

---

## Prerequisites
1. **Environment Setup**:
   - Install the RSAT (Remote Server Administration Tools) if managing AD remotely.
   - Import the Active Directory module in PowerShell:
     ```powershell
     Import-Module ActiveDirectory
     ```
2. **Permissions**:
   - Ensure the account running the commands has the necessary AD permissions (e.g., Domain Admin or delegated permissions).

---

## Key Cmdlets for User Management
1. **`Get-ADUser`**: Retrieve user details.
2. **`New-ADUser`**: Create a new user.
3. **`Set-ADUser`**: Modify an existing user.
4. **`Remove-ADUser`**: Delete a user.
5. **`Unlock-ADAccount`**: Unlock a locked-out user account.
6. **`Enable-ADAccount`/`Disable-ADAccount`**: Enable or disable a user account.

---

## Creating Users
### Basic User Creation
Create a user with minimal properties:
```powershell
New-ADUser -Name "John Doe" -SamAccountName "jdoe" -Path "OU=Users,DC=domain,DC=com"
```

### Detailed User Creation
Create a user with detailed attributes:
```powershell
New-ADUser -Name "Jane Doe" -SamAccountName "jdoe" `
  -UserPrincipalName "jdoe@domain.com" -EmailAddress "jdoe@domain.com" `
  -GivenName "Jane" -Surname "Doe" -DisplayName "Jane Doe" `
  -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
  -Enabled $true -Path "OU=Users,DC=domain,DC=com"
```

### Bulk User Creation
Use a CSV file to create multiple users:
1. Prepare a CSV file (`users.csv`) with columns:
   ```csv
   Name,SamAccountName,UserPrincipalName,OU
   John Doe,jdoe,jdoe@domain.com,OU=Users,DC=domain,DC=com
   Jane Smith,jsmith,jsmith@domain.com,OU=Staff,DC=domain,DC=com
   ```
2. Run the script:
   ```powershell
   Import-Csv -Path "users.csv" | ForEach-Object {
       New-ADUser -Name $_.Name -SamAccountName $_.SamAccountName `
         -UserPrincipalName $_.UserPrincipalName -Path $_.OU `
         -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
         -Enabled $true
   }
   ```

---

## Retrieving User Information
### Retrieve a Single User
```powershell
Get-ADUser -Identity "jdoe"
```

### Retrieve Specific Attributes
```powershell
Get-ADUser -Identity "jdoe" -Properties DisplayName,EmailAddress
```

### Retrieve Users from a Specific OU
```powershell
Get-ADUser -Filter * -SearchBase "OU=Users,DC=domain,DC=com"
```

### Advanced Filtering
```powershell
Get-ADUser -Filter {Enabled -eq $true -and PasswordNeverExpires -eq $false}
```

---

## Modifying Users
### Update Basic Attributes
```powershell
Set-ADUser -Identity "jdoe" -Title "Software Engineer" -Department "IT"
```

### Reset a User Password
```powershell
Set-ADAccountPassword -Identity "jdoe" -NewPassword (ConvertTo-SecureString "NewP@ssw0rd!" -AsPlainText -Force) -Reset
```

### Enable or Disable an Account
Enable a user account:
```powershell
Enable-ADAccount -Identity "jdoe"
```
Disable a user account:
```powershell
Disable-ADAccount -Identity "jdoe"
```

---

## Unlocking Accounts
Unlock a locked-out user account:
```powershell
Unlock-ADAccount -Identity "jdoe"
```

---

## Deleting Users
### Delete a Single User
```powershell
Remove-ADUser -Identity "jdoe" -Confirm:$false
```

### Bulk Deletion from CSV
1. Prepare a CSV file (`delete_users.csv`) with the column `SamAccountName`.
   ```csv
   SamAccountName
   jdoe
   jsmith
   ```
2. Run the script:
   ```powershell
   Import-Csv -Path "delete_users.csv" | ForEach-Object {
       Remove-ADUser -Identity $_.SamAccountName -Confirm:$false
   }
   ```

---

## Common Scenarios
1. **Find Disabled Users**:
   ```powershell
   Get-ADUser -Filter {Enabled -eq $false}
   ```

2. **List Users Without Email Addresses**:
   ```powershell
   Get-ADUser -Filter * -Properties EmailAddress | Where-Object { -not $_.EmailAddress }
   ```

3. **Find Accounts Locked Out**:
   ```powershell
   Search-ADAccount -LockedOut
   ```

---

## Best Practices
1. Use scripts for repetitive tasks like bulk user creation or deletion.
2. Always test scripts in a non-production environment.
3. Secure sensitive information, such as passwords, using encryption or secure storage.
4. Follow organizational policies for user management, including naming conventions and permissions.
5. Log all changes for auditing purposes.

---

