# Active Directory (AD) Group and Organizational Unit (OU) Management with PowerShell

This document provides a detailed guide on managing Active Directory (AD) groups and organizational units (OUs) using PowerShell. It includes explanations, examples, and best practices to ensure clarity and effectiveness for all users.

## Prerequisites
Before proceeding, ensure the following:

1. **Active Directory Module**: The Active Directory module for PowerShell is installed.
   ```powershell
   Import-Module ActiveDirectory
   ```
2. **User Permissions**: You have the required permissions to manage groups and OUs in the AD environment.
3. **PowerShell Version**: Use PowerShell 5.1 or later for best compatibility.

## Managing Groups in AD

### 1. Listing Groups
You can retrieve groups in your domain using the `Get-ADGroup` cmdlet:

```powershell
# List all groups
Get-ADGroup -Filter * | Select-Object Name, GroupScope, Description

# Search for a specific group by name
Get-ADGroup -Filter {Name -like '*Admins*'} | Select-Object Name, GroupScope, Description
```

### 2. Creating Groups
To create a new group, use the `New-ADGroup` cmdlet:

```powershell
New-ADGroup -Name "HR Team" -GroupScope Global -GroupCategory Security -Path "OU=Groups,DC=domain,DC=com" -Description "HR Department Security Group"
```

Parameters:
- **`-Name`**: Name of the group.
- **`-GroupScope`**: Choose from `Global`, `Universal`, or `DomainLocal`.
- **`-GroupCategory`**: Specify `Security` or `Distribution`.
- **`-Path`**: Organizational Unit where the group will be created.
- **`-Description`**: Provide a meaningful description.

### 3. Modifying Groups
You can update group properties using the `Set-ADGroup` cmdlet:

```powershell
Set-ADGroup -Identity "HR Team" -Description "Updated description for HR Team"
```

### 4. Adding Members to Groups
To add members to a group, use `Add-ADGroupMember`:

```powershell
Add-ADGroupMember -Identity "HR Team" -Members "jdoe", "asmith"
```

### 5. Removing Members from Groups
To remove members, use `Remove-ADGroupMember`:

```powershell
Remove-ADGroupMember -Identity "HR Team" -Members "jdoe" -Confirm:$false
```

### 6. Deleting Groups
To delete a group, use `Remove-ADGroup`:

```powershell
Remove-ADGroup -Identity "HR Team" -Confirm:$false
```

## Managing Organizational Units (OUs) in AD

### 1. Listing OUs
To view OUs in your domain, use `Get-ADOrganizationalUnit`:

```powershell
# List all OUs
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName

# Search for a specific OU
Get-ADOrganizationalUnit -Filter {Name -like '*Users*'} | Select-Object Name, DistinguishedName
```

### 2. Creating OUs
To create a new OU, use the `New-ADOrganizationalUnit` cmdlet:

```powershell
New-ADOrganizationalUnit -Name "HR Department" -Path "DC=domain,DC=com" -ProtectedFromAccidentalDeletion $true
```

Parameters:
- **`-Name`**: Name of the OU.
- **`-Path`**: Location where the OU will be created.
- **`-ProtectedFromAccidentalDeletion`**: Prevent accidental deletion.

### 3. Modifying OUs
To update OU properties, use `Set-ADOrganizationalUnit`:

```powershell
Set-ADOrganizationalUnit -Identity "OU=HR Department,DC=domain,DC=com" -Description "Organizational Unit for HR Department"
```

### 4. Deleting OUs
To delete an OU, ensure it is empty and then use `Remove-ADOrganizationalUnit`:

```powershell
Remove-ADOrganizationalUnit -Identity "OU=HR Department,DC=domain,DC=com" -Confirm:$false
```

## Best Practices for Group and OU Management

1. **Naming Conventions**:
   - Use consistent and descriptive names for groups and OUs (e.g., `Dept-Admins`, `OU=Finance`).
   - Avoid using special characters in names.

2. **Group Scopes**:
   - Use **Global Groups** for domain-specific users.
   - Use **Universal Groups** for multi-domain membership.

3. **OU Design**:
   - Organize OUs based on business functions or geographic locations.
   - Avoid deeply nested OU structures for simplicity.

4. **Security**:
   - Enable `-ProtectedFromAccidentalDeletion` for critical OUs.
   - Regularly review group memberships for accuracy.

5. **Documentation and Auditing**:
   - Maintain documentation of group and OU changes.
   - Use logging to track modifications:
     ```powershell
     Get-EventLog -LogName Security | Where-Object { $_.EventID -eq 4728 }  # Example for group membership changes
     ```

## Troubleshooting

1. **Permissions Issues**:
   - Ensure you have adequate permissions for the target groups and OUs.

2. **Cmdlet Not Found**:
   - Confirm the Active Directory module is imported.

3. **Deletion Errors**:
   - Check for dependencies (e.g., child objects in OUs).

