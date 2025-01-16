# Active Directory Automation Scripts Using PowerShell

### Introduction to AD Automation with PowerShell

Automating Active Directory (AD) management tasks can save time, reduce errors, and improve operational efficiency. PowerShell provides a robust framework for automating a wide range of AD tasks such as user creation, management, and deletion, along with group management, password resets, and more.

In this document, we will cover several common automation scenarios for managing AD resources with PowerShell, from creating user accounts to assigning permissions, generating reports, and cleaning up inactive accounts.

### Prerequisites

Before running any automation scripts for AD management, ensure the following:
- **RSAT (Remote Server Administration Tools)** is installed and configured.
- PowerShell is running with **Administrator privileges**.
- Import the **ActiveDirectory module** into your PowerShell session:
  ```powershell
  Import-Module ActiveDirectory
  ```

### Common Active Directory Automation Tasks

#### 1. **Automating User Account Creation**

A common task in AD management is automating the creation of user accounts. Below is an example of a script that automates user creation based on a CSV file input.

##### Script to Automate User Creation from CSV:
```powershell
# Import user data from a CSV file
$users = Import-Csv -Path "C:\scripts\new_users.csv"

# Loop through each user and create the account
foreach ($user in $users) {
    New-ADUser -Name $user.Name `
               -SamAccountName $user.SamAccountName `
               -UserPrincipalName $user.UserPrincipalName `
               -GivenName $user.GivenName `
               -Surname $user.Surname `
               -Department $user.Department `
               -Title $user.Title `
               -Path "OU=Users,DC=domain,DC=com" `
               -AccountPassword (ConvertTo-SecureString -AsPlainText $user.Password -Force) `
               -Enabled $true `
               -PassThru
}
```
**CSV Example** (`new_users.csv`):
```csv
Name,SamAccountName,UserPrincipalName,GivenName,Surname,Department,Title,Password
John Doe,jdoe,jdoe@domain.com,John,Doe,Sales,Manager,P@ssw0rd!
Jane Smith,jsmith,jsmith@domain.com,Jane,Smith,HR,Coordinator,P@ssw0rd!
```

This script imports user data from a CSV file and creates users in the specified Organizational Unit (OU).

#### 2. **Automating User Account Modification**

You may need to update existing user attributes in AD, such as email address, phone number, or department. The following script automates this process.

##### Script to Update User Attributes:
```powershell
# Import data for user modifications
$modifications = Import-Csv -Path "C:\scripts\user_modifications.csv"

foreach ($mod in $modifications) {
    Set-ADUser -Identity $mod.SamAccountName `
               -Title $mod.Title `
               -Department $mod.Department `
               -EmailAddress $mod.EmailAddress `
               -PhoneNumber $mod.PhoneNumber
}
```
**CSV Example** (`user_modifications.csv`):
```csv
SamAccountName,Title,Department,EmailAddress,PhoneNumber
jdoe,Senior Manager,Sales,jdoe@domain.com,+1-555-1234
jsmith,HR Director,HR,jsmith@domain.com,+1-555-5678
```

This script reads user modification details from a CSV file and applies changes to the respective AD users.

#### 3. **Bulk User Account Deletion**

Occasionally, users may need to be removed from AD, and doing this manually for a large number of accounts can be tedious. The following script automates the bulk deletion of users from AD.

##### Script to Delete Users in Bulk:
```powershell
# Import user data to be deleted
$usersToDelete = Import-Csv -Path "C:\scripts\users_to_delete.csv"

foreach ($user in $usersToDelete) {
    Remove-ADUser -Identity $user.SamAccountName -Confirm:$false
}
```
**CSV Example** (`users_to_delete.csv`):
```csv
SamAccountName
jdoe
jsmith
```

This script removes AD users based on the provided `SamAccountName` from a CSV file.

#### 4. **Automating Password Resets**

Resetting passwords is another frequent task. Automating it ensures that password changes are performed uniformly and efficiently.

##### Script to Reset User Passwords:
```powershell
# Import user data for password reset
$passwordResetData = Import-Csv -Path "C:\scripts\password_resets.csv"

foreach ($user in $passwordResetData) {
    Set-ADAccountPassword -Identity $user.SamAccountName `
                          -NewPassword (ConvertTo-SecureString -AsPlainText $user.NewPassword -Force) `
                          -Reset
}
```
**CSV Example** (`password_resets.csv`):
```csv
SamAccountName,NewPassword
jdoe,NewP@ssw0rd!
jsmith,NewP@ssw0rd!
```

This script resets the passwords for users listed in the CSV file.

#### 5. **Cleaning Up Inactive User Accounts**

Inactive user accounts are a security risk and should be removed periodically. The following script identifies accounts that have been inactive for a specified number of days and disables or deletes them.

##### Script to Disable Inactive Accounts:
```powershell
# Specify the inactivity threshold (e.g., 90 days)
$inactiveDays = 90
$thresholdDate = (Get-Date).AddDays(-$inactiveDays)

# Get users who haven't logged in for the threshold period
$inactiveUsers = Get-ADUser -Filter {LastLogonDate -lt $thresholdDate} -Properties LastLogonDate

foreach ($user in $inactiveUsers) {
    Disable-ADAccount -Identity $user.SamAccountName
}
```

This script disables accounts that haven't logged in within the last 90 days.

### Advanced Automation: Scheduling Tasks

To automate the above tasks on a regular basis, you can use **Task Scheduler** or **PowerShell jobs** to run scripts at predefined intervals.

#### Example: Schedule a Script to Run Daily
```powershell
$scriptPath = "C:\scripts\password_resets.ps1"
$taskName = "DailyPasswordReset"

# Create a scheduled task to run the script daily at 2 AM
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $scriptPath"
$trigger = New-ScheduledTaskTrigger -Daily -At "2:00AM"
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName
```

### Best Practices for AD Automation Scripts

1. **Error Handling**: Ensure scripts include error handling (`try-catch`) to manage exceptions gracefully.
   ```powershell
   try {
       # Some AD operation
   } catch {
       Write-Error "Failed to execute the operation: $_"
   }
   ```

2. **Logging**: Log script outputs and errors to a file to track operations.
   ```powershell
   $logPath = "C:\scripts\log.txt"
   Add-Content -Path $logPath -Value "Operation completed at $(Get-Date)"
   ```

3. **Test Before Production**: Always test automation scripts in a safe environment before applying them to production.

4. **Security Considerations**: Use secure methods for handling passwords and sensitive data. Avoid hardcoding credentials in scripts.

### Conclusion

Automating Active Directory tasks with PowerShell can significantly enhance productivity and consistency in managing user accounts, groups, and other AD objects. By leveraging PowerShell's powerful cmdlets, you can streamline common administrative tasks, improve security, and reduce human error.

---