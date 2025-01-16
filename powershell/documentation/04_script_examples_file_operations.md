# PowerShell Script Examples: File Operations

## Introduction
PowerShell provides robust features for file management and operations. This document covers various file operations such as creating, reading, updating, and deleting files using PowerShell. Each example is explained step-by-step to help you understand the concepts clearly.

---

## 1. Creating a File
### Script:
```powershell
# Create a new file and add content to it
$filePath = "C:\Temp\example.txt"
$content = "This is a sample file created using PowerShell."

# Create the file and write content
Set-Content -Path $filePath -Value $content
```
### Explanation:
- `$filePath`: Specifies the location and name of the file.
- `$content`: Contains the text to be written to the file.
- `Set-Content`: Writes the content to the file. If the file doesn’t exist, it is created.

---

## 2. Reading a File
### Script:
```powershell
# Read the content of a file
$filePath = "C:\Temp\example.txt"

# Read and display the file content
$content = Get-Content -Path $filePath
Write-Output $content
```
### Explanation:
- `Get-Content`: Reads the contents of the file.
- `Write-Output`: Displays the content in the console.

---

## 3. Updating a File
### Script:
```powershell
# Append new content to an existing file
$filePath = "C:\Temp\example.txt"
$newContent = "This is additional content added to the file."

# Append the content
Add-Content -Path $filePath -Value $newContent
```
### Explanation:
- `Add-Content`: Appends the specified text to the existing file.

---

## 4. Deleting a File
### Script:
```powershell
# Delete a file
$filePath = "C:\Temp\example.txt"

# Remove the file
Remove-Item -Path $filePath -Force
```
### Explanation:
- `Remove-Item`: Deletes the specified file.
- `-Force`: Ensures deletion even if the file is read-only.

---

## 5. Checking If a File Exists
### Script:
```powershell
# Check if a file exists
$filePath = "C:\Temp\example.txt"

if (Test-Path -Path $filePath) {
    Write-Output "The file exists."
} else {
    Write-Output "The file does not exist."
}
```
### Explanation:
- `Test-Path`: Checks if the specified file or directory exists.

---

## 6. Renaming a File
### Script:
```powershell
# Rename a file
$filePath = "C:\Temp\example.txt"
$newName = "C:\Temp\renamed_example.txt"

# Rename the file
Rename-Item -Path $filePath -NewName $newName
```
### Explanation:
- `Rename-Item`: Renames the specified file or directory.

---

## 7. Copying a File
### Script:
```powershell
# Copy a file to a new location
$sourcePath = "C:\Temp\example.txt"
$destinationPath = "C:\Temp\example_copy.txt"

# Copy the file
Copy-Item -Path $sourcePath -Destination $destinationPath
```
### Explanation:
- `Copy-Item`: Copies the file to the specified destination.

---

## 8. Moving a File
### Script:
```powershell
# Move a file to a new location
$sourcePath = "C:\Temp\example.txt"
$destinationPath = "C:\NewFolder\example.txt"

# Move the file
Move-Item -Path $sourcePath -Destination $destinationPath
```
### Explanation:
- `Move-Item`: Moves the file to the specified location.

---

## 9. Reading Large Files Efficiently
### Script:
```powershell
# Read a large file line by line
$filePath = "C:\Temp\largefile.txt"

# Read the file line by line
Get-Content -Path $filePath -ReadCount 1 | ForEach-Object {
    Write-Output $_
}
```
### Explanation:
- `-ReadCount 1`: Reads one line at a time, reducing memory usage for large files.

---

## 10. Working with File Attributes
### Script:
```powershell
# Get file attributes
$filePath = "C:\Temp\example.txt"
$file = Get-Item -Path $filePath

# Display file attributes
Write-Output $file.Attributes

# Set file to read-only
Set-ItemProperty -Path $filePath -Name Attributes -Value ReadOnly
```
### Explanation:
- `Get-Item`: Retrieves the file object.
- `Set-ItemProperty`: Modifies file properties, such as making it read-only.

---

## Conclusion
This document provides comprehensive examples of file operations using PowerShell. By practicing these scripts, you can effectively manage files and automate tasks in your environment.

