# GCP VM Creation Script Using PowerShell

## Overview
This document provides a step-by-step guide to creating a Google Cloud Platform (GCP) Virtual Machine (VM) instance using PowerShell. It explains the prerequisites, script breakdown, and execution process in detail to ensure a comprehensive understanding for beginners and advanced users alike.

---

## Prerequisites
Before starting, ensure the following:
1. **GCP Project**:
   - A GCP project is set up and you have the `Project ID`.
2. **Authentication**:
   - Install the [gcloud CLI](https://cloud.google.com/sdk/docs/install) and authenticate using:
     ```bash
     gcloud auth login
     gcloud auth application-default login
     ```
   - Obtain the access token using:
     ```bash
     gcloud auth application-default print-access-token
     ```
3. **PowerShell Environment**:
   - Install PowerShell (if not already installed). Use [PowerShell 7+](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell) for best compatibility.
   - Optionally, install Visual Studio Code for script editing and debugging.

---

## GCP VM Creation Script

### Script Breakdown
Below is the PowerShell script for creating a GCP VM instance using REST API. Each section is explained to ensure clarity.

#### 1. Define Variables
Define project-specific and VM-specific variables for customization:
```powershell
# GCP Project and Zone Configuration
$project = "your-project-id"   # Replace with your GCP project ID
$zone = "us-central1-a"       # Replace with your desired zone

# VM Configuration
$instanceName = "my-vm-instance"   # Desired VM name
$machineType = "n1-standard-1"     # Machine type (e.g., n1-standard-1)
$imageFamily = "debian-11"         # OS image family (e.g., Debian 11)
$imageProject = "debian-cloud"     # Project hosting the image

# Authentication Token
$authToken = "your-access-token"   # Replace with the token obtained earlier
```

#### 2. Create the Request Body
Prepare the JSON payload for the VM creation request:
```powershell
# VM Creation Payload
$body = @{
    "name" = $instanceName
    "machineType" = "zones/$zone/machineTypes/$machineType"
    "networkInterfaces" = @(@{ "network" = "global/networks/default" })
    "disks" = @(@{
        "boot" = $true
        "initializeParams" = @{
            "sourceImage" = "projects/$imageProject/global/images/family/$imageFamily"
        }
    })
} | ConvertTo-Json -Depth 10
```

#### 3. Send the API Request
Use the `Invoke-RestMethod` cmdlet to interact with the GCP Compute Engine API:
```powershell
# API Endpoint
$uri = "https://www.googleapis.com/compute/v1/projects/$project/zones/$zone/instances"

# API Request
$response = Invoke-RestMethod -Uri $uri `
    -Method POST `
    -Headers @{ "Authorization" = "Bearer $authToken" } `
    -Body $body

# Output the Response
$response
```

### Complete Script
Combine all the sections into a single script:
```powershell
# Define Variables
$project = "your-project-id"
$zone = "us-central1-a"
$instanceName = "my-vm-instance"
$machineType = "n1-standard-1"
$imageFamily = "debian-11"
$imageProject = "debian-cloud"
$authToken = "your-access-token"

# Create Request Body
$body = @{
    "name" = $instanceName
    "machineType" = "zones/$zone/machineTypes/$machineType"
    "networkInterfaces" = @(@{ "network" = "global/networks/default" })
    "disks" = @(@{
        "boot" = $true
        "initializeParams" = @{
            "sourceImage" = "projects/$imageProject/global/images/family/$imageFamily"
        }
    })
} | ConvertTo-Json -Depth 10

# Send API Request
$uri = "https://www.googleapis.com/compute/v1/projects/$project/zones/$zone/instances"
$response = Invoke-RestMethod -Uri $uri `
    -Method POST `
    -Headers @{ "Authorization" = "Bearer $authToken" } `
    -Body $body

# Output Response
$response
```

---

## Testing and Validation
1. Save the script as `CreateGCPVM.ps1`.
2. Run the script in PowerShell:
   ```powershell
   .\CreateGCPVM.ps1
   ```
3. Verify the VM instance creation:
   - Log in to the GCP Console.
   - Navigate to **Compute Engine** > **VM Instances**.
   - Confirm the new VM instance appears in the list.

---

## Troubleshooting
### Common Errors
1. **Authentication Error**:
   - Ensure the access token is valid and not expired.
   - Reauthenticate using:
     ```bash
     gcloud auth application-default login
     ```

2. **Invalid Project or Zone**:
   - Double-check the `project` and `zone` variables.
   - Ensure the Compute Engine API is enabled for your project.

3. **Insufficient Permissions**:
   - Ensure your account has `Compute Instance Admin` role.

### Debugging Tips
- Add verbose logging:
  ```powershell
  Invoke-RestMethod ... -Debug
  ```
- Use `Write-Host` to display intermediate values during script execution.

---


