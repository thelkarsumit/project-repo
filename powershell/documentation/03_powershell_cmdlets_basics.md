# PowerShell Cmdlets Basics

PowerShell cmdlets (pronounced *command-lets*) are lightweight commands used in the PowerShell environment to perform specific tasks. They are the building blocks of PowerShell scripts and are designed to work seamlessly with objects.

---

## **1. What Are Cmdlets?**
Cmdlets are specialized .NET classes that perform a single operation. Unlike traditional commands or scripts, cmdlets:
- Return .NET objects instead of plain text.
- Follow a consistent naming convention: `Verb-Noun`.
- Support piping, allowing output from one cmdlet to be input to another.

### Examples:
- `Get-Process`: Retrieves a list of running processes.
- `Set-Date`: Sets the system date and time.
- `New-Item`: Creates a new file, directory, or registry key.

---

## **2. Naming Convention**
Cmdlets follow the `Verb-Noun` naming convention to ensure clarity and consistency.

### Common Verbs:
| Verb         | Description                           |
|--------------|---------------------------------------|
| `Get`        | Retrieves data or objects.            |
| `Set`        | Modifies or assigns values.           |
| `New`        | Creates new resources.                |
| `Remove`     | Deletes resources.                    |
| `Start`      | Initiates an operation or process.    |
| `Stop`       | Halts an operation or process.        |
| `Export`     | Saves data to a file or other output. |
| `Import`     | Reads data from an external source.   |

### Examples:
- `Get-Help`: Displays help about cmdlets or concepts.
- `Remove-Item`: Deletes a file or directory.

---

## **3. Discovering Cmdlets**
PowerShell provides built-in tools to explore available cmdlets.

### **3.1. `Get-Command`**
Lists all available cmdlets, functions, and aliases.
```powershell
Get-Command
```
#### Filter by Name:
```powershell
Get-Command -Name "*Process*"
```
#### Filter by Type:
```powershell
Get-Command -CommandType Cmdlet
```

### **3.2. `Get-Help`**
Displays detailed information about a specific cmdlet.
```powershell
Get-Help Get-Process
```
#### View Examples:
```powershell
Get-Help Get-Process -Examples
```
#### Show Detailed Help:
```powershell
Get-Help Get-Process -Detailed
```

### **3.3. `Get-Member`**
Displays the properties and methods of objects returned by a cmdlet.
```powershell
Get-Process | Get-Member
```

---

## **4. Working with Cmdlets**

### **4.1. Piping**
Cmdlets support piping, where the output of one cmdlet becomes the input for another.

#### Example:
```powershell
Get-Process | Where-Object {$_.CPU -gt 100} | Sort-Object CPU -Descending
```
- `Get-Process`: Retrieves running processes.
- `Where-Object`: Filters processes using a condition.
- `Sort-Object`: Sorts filtered results.

### **4.2. Using Parameters**
Cmdlets accept parameters to customize their behavior.

#### Example:
```powershell
Get-ChildItem -Path "C:\" -Recurse
```
- `-Path`: Specifies the directory.
- `-Recurse`: Searches subdirectories recursively.

### **4.3. Output Formatting**
Control how cmdlet output is displayed.

#### Example:
```powershell
Get-Service | Format-Table -Property Name, Status
```
- `Format-Table`: Displays results in a table format.
- `-Property`: Specifies columns to include.

---

## **5. Commonly Used Cmdlets**

### **5.1. System Information**
| Cmdlet              | Description                    |
|---------------------|--------------------------------|
| `Get-Process`       | Lists running processes.       |
| `Get-Service`       | Displays services on a system. |
| `Get-EventLog`      | Reads event logs.              |
| `Get-WmiObject`     | Retrieves system information.  |

### **5.2. File and Directory Management**
| Cmdlet              | Description                           |
|---------------------|---------------------------------------|
| `Get-ChildItem`     | Lists files and directories.          |
| `New-Item`          | Creates files or directories.         |
| `Copy-Item`         | Copies files or directories.          |
| `Remove-Item`       | Deletes files or directories.         |

### **5.3. User Management**
| Cmdlet              | Description                             |
|---------------------|-----------------------------------------|
| `Get-LocalUser`     | Lists local user accounts.              |
| `New-LocalUser`     | Creates a new local user account.       |
| `Set-LocalUser`     | Modifies properties of a user account.  |
| `Remove-LocalUser`  | Deletes a local user account.           |

---

## **6. Writing Your First Cmdlet**
Combine cmdlets to automate tasks. For example:
```powershell
# Example: Monitor high CPU usage processes and save to a file
$processes = Get-Process | Where-Object {$_.CPU -gt 100}
$processes | Export-Csv -Path "C:\HighCPUProcesses.csv" -NoTypeInformation
```
- Filters processes with CPU usage over 100.
- Saves the results to a CSV file.

---

## **7. Best Practices**
1. **Use `Get-Help`:** Always refer to cmdlet documentation for clarity.
2. **Use Aliases Sparingly:** Prefer full cmdlet names for readability.
3. **Filter Early:** Apply filtering (`Where-Object`) as early as possible in a pipeline to optimize performance.
4. **Format Late:** Use formatting cmdlets (e.g., `Format-Table`) at the end of pipelines to maintain object integrity.

---

By mastering cmdlets, you unlock the full potential of PowerShell to automate, manage, and troubleshoot efficiently. Experiment with examples, explore advanced cmdlets, and incorporate best practices into your workflow!

