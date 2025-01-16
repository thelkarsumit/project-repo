# **Managing GCP Resources Using PowerShell**

This document will guide you through the steps to manage Google Cloud Platform (GCP) resources using PowerShell. We will cover how to install the necessary tools, authenticate to GCP, and manage common resources like Compute Engine (VM instances), Cloud Storage, and Cloud SQL.

## **Table of Contents**
1. Introduction
2. Prerequisites
3. Setting Up PowerShell for GCP
   - Installing Google Cloud SDK
   - Installing PowerShell GoogleCloud Module
4. Authenticating with GCP
5. Managing Compute Engine (VM Instances)
   - Creating a VM
   - Listing VM Instances
   - Starting and Stopping a VM
6. Managing Cloud Storage (Buckets and Objects)
   - Creating a Storage Bucket
   - Uploading Files to Cloud Storage
   - Listing Files in a Bucket
7. Managing Cloud SQL
   - Creating a Cloud SQL Instance
   - Managing Users and Databases in Cloud SQL
8. Advanced Operations
   - Using REST APIs with PowerShell
   - Error Handling and Logging
9. Best Practices
10. Conclusion

---

### **1. Introduction**

PowerShell is a powerful scripting environment for automating system management tasks, and it can be used to interact with GCP through APIs and SDKs. By leveraging PowerShell scripts, you can automate the management of GCP resources such as Compute Engine, Cloud Storage, and Cloud SQL. This document will show you how to configure PowerShell for GCP and provide examples of commonly used commands and scripts.

---

### **2. Prerequisites**

Before you can manage GCP resources with PowerShell, make sure you have the following:

- A Google Cloud account with appropriate permissions.
- Installed PowerShell on your system (Windows, macOS, or Linux).
- Installed the Google Cloud SDK and PowerShell GoogleCloud module.

---

### **3. Setting Up PowerShell for GCP**

#### **Installing Google Cloud SDK**

To interact with GCP, you must have the Google Cloud SDK installed. Here’s how to install it:

1. Download and install the Google Cloud SDK from [here](https://cloud.google.com/sdk/docs/install).
2. Initialize the SDK by running the following command in PowerShell:
   ```powershell
   gcloud init
   ```

#### **Installing PowerShell GoogleCloud Module**

To manage GCP resources from PowerShell, you will need to install the PowerShell GoogleCloud module. Run the following command in PowerShell:
```powershell
Install-Module -Name GoogleCloud
```

---

### **4. Authenticating with GCP**

To authenticate PowerShell with your GCP account, use the following command:
```powershell
gcloud auth login
```
This will open a browser window where you can sign in to your Google Cloud account.

Once authenticated, set your project and region for GCP resources:
```powershell
gcloud config set project <your-project-id>
gcloud config set compute/region <your-region>
gcloud config set compute/zone <your-zone>
```

---

### **5. Managing Compute Engine (VM Instances)**

#### **Creating a VM Instance**

To create a VM instance in Google Compute Engine, use the following script:
```powershell
$project = "<your-project-id>"
$zone = "us-central1-a"
$instanceName = "my-vm-instance"
$image = "projects/debian-cloud/global/images/family/debian-11"
$machineType = "n1-standard-1"

$body = @{
    "name" = $instanceName
    "machineType" = "zones/$zone/machineTypes/$machineType"
    "networkInterfaces" = @(@{ "network" = "global/networks/default" })
    "disks" = @(@{
        "boot" = $true
        "initializeParams" = @{
            "sourceImage" = $image
        }
    })
}

Invoke-RestMethod -Uri "https://www.googleapis.com/compute/v1/projects/$project/zones/$zone/instances" `
    -Method POST `
    -Headers @{ "Authorization" = "Bearer $(gcloud auth print-access-token)" } `
    -Body ($body | ConvertTo-Json -Depth 10)
```

#### **Listing VM Instances**

To list all VM instances in your project:
```powershell
gcloud compute instances list
```

#### **Starting and Stopping a VM**

To start or stop a VM instance:
```powershell
# Start VM
gcloud compute instances start my-vm-instance --zone us-central1-a

# Stop VM
gcloud compute instances stop my-vm-instance --zone us-central1-a
```

---

### **6. Managing Cloud Storage (Buckets and Objects)**

#### **Creating a Storage Bucket**

To create a Cloud Storage bucket:
```powershell
$bucketName = "my-storage-bucket"
gcloud storage buckets create gs://$bucketName
```

#### **Uploading Files to Cloud Storage**

To upload files to your bucket:
```powershell
$localFile = "C:\path\to\your\file.txt"
$bucketName = "my-storage-bucket"
gcloud storage cp $localFile gs://$bucketName/
```

#### **Listing Files in a Bucket**

To list the contents of a bucket:
```powershell
gcloud storage ls gs://$bucketName/
```

---

### **7. Managing Cloud SQL**

#### **Creating a Cloud SQL Instance**

To create a Cloud SQL instance:
```powershell
$instanceName = "my-sql-instance"
$databaseVersion = "MYSQL_5_7"
gcloud sql instances create $instanceName --database-version=$databaseVersion --tier=db-f1-micro --region=us-central1
```

#### **Managing Users and Databases in Cloud SQL**

To create a user in Cloud SQL:
```powershell
gcloud sql users create myuser --instance=$instanceName --password=mysecurepassword
```

To create a database in Cloud SQL:
```powershell
gcloud sql databases create mydatabase --instance=$instanceName
```

---

### **8. Advanced Operations**

#### **Using REST APIs with PowerShell**

You can also interact with GCP REST APIs using PowerShell’s `Invoke-RestMethod` cmdlet. For example, to list instances:
```powershell
$project = "<your-project-id>"
$zone = "us-central1-a"
$authToken = gcloud auth print-access-token
$uri = "https://www.googleapis.com/compute/v1/projects/$project/zones/$zone/instances"
$response = Invoke-RestMethod -Uri $uri -Headers @{ "Authorization" = "Bearer $authToken" }
$response.items
```

#### **Error Handling and Logging**

To handle errors and log them, use `try-catch` blocks:
```powershell
try {
    # Your GCP command
    gcloud compute instances list
} catch {
    Write-Error "An error occurred: $_"
}
```

---

### **9. Best Practices**

- **Authentication**: Always use service accounts for production scripts.
- **Security**: Store sensitive information like API keys or passwords securely.
- **Error Handling**: Implement robust error handling in your scripts to avoid failures.
- **Logging**: Enable logging to capture output for debugging.

---

### **10. Conclusion**

PowerShell provides a powerful and flexible way to manage GCP resources. By following this guide, you can automate the creation, management, and deletion of GCP resources, as well as interact with the Cloud APIs to perform advanced operations. With the right setup, you can efficiently manage your infrastructure using PowerShell.

---

