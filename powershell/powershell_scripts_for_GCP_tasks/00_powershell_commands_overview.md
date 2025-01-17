
| **Command**         | **Purpose**                                                      | **Usage Example**                                            | **Explanation**                                                      |
|---------------------|------------------------------------------------------------------|--------------------------------------------------------------|----------------------------------------------------------------------|
| `Write-Host`         | Displays output to the console                                    | `Write-Host "Hello, World!"`                                  | Directly prints messages to the console (not for capturing output).   |
| `Write-Output`       | Sends the output to the pipeline                                  | `Write-Output "Output to pipeline"`                           | Sends output to the pipeline for further processing.                 |
| `Get-Command`        | Retrieves available cmdlets, functions, workflows, or aliases    | `Get-Command`                                                | Lists all available cmdlets, functions, and external commands.       |
| `Get-Help`           | Provides help for cmdlets, functions, workflows, or scripts      | `Get-Help Get-Command`                                       | Displays help and usage details for the specified cmdlet.            |
| `Set-Variable`       | Creates, modifies, or deletes variables                          | `Set-Variable -Name "MyVar" -Value "TestValue"`               | Creates or modifies a variable with a specified value.               |
| `Get-Variable`       | Retrieves the value of a variable                                | `Get-Variable -Name "MyVar"`                                  | Retrieves the current value of a specified variable.                 |
| `Get-Process`        | Retrieves a list of running processes                             | `Get-Process`                                                | Lists the currently running processes.                               |
| `Stop-Process`       | Stops a running process by its process ID or name                | `Stop-Process -Name "notepad"`                                | Terminates the specified process.                                    |
| `Start-Process`      | Starts a new process (e.g., opening a program)                   | `Start-Process "notepad"`                                    | Launches a new process, such as opening Notepad.                     |
| `Get-Content`        | Reads content from a file                                        | `Get-Content "file.txt"`                                      | Retrieves the contents of a file.                                    |
| `Set-Content`        | Writes content to a file (replaces existing content)            | `Set-Content "file.txt" "New content"`                        | Replaces the content of a file with new data.                        |
| `Add-Content`        | Appends content to a file                                        | `Add-Content "file.txt" "Appended text"`                      | Appends new content to the end of a file.                            |
| `Remove-Item`        | Deletes files or directories                                     | `Remove-Item "file.txt"`                                      | Deletes the specified file or directory.                             |
| `Test-Path`          | Checks whether a file or directory exists                        | `Test-Path "file.txt"`                                        | Returns `True` if the file or directory exists, otherwise `False`.   |
| `New-Item`           | Creates new files, folders, or registry keys                     | `New-Item -Path "C:\folder" -ItemType "Directory"`            | Creates a new file, folder, or registry key.                         |
| `Remove-Variable`    | Removes a variable from the session                              | `Remove-Variable -Name "MyVar"`                               | Deletes a variable from the session.                                 |
| `Clear-Variable`     | Clears the value of a variable                                   | `Clear-Variable -Name "MyVar"`                                | Resets a variable’s value to `$null`, but keeps the variable in memory. |
| `ForEach-Object`     | Iterates over each object in the pipeline                        | `Get-Process | ForEach-Object { $_.Name }`                      | Loops through each item in the pipeline and performs an action.      |
| `If-Else`            | Conditional statements to perform actions based on conditions    | `if ($value -eq "Test") { Write-Host "Matched" } else { Write-Host "Not Matched" }` | Executes different actions based on conditions. |

---
