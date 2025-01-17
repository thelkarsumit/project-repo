# 04_create_gcp_vm.ps1
# This script creates a Google Cloud VM instance using the gcloud CLI.
# Prerequisites:
# - Google Cloud CLI (gcloud) installed
# - Authentication to GCP is completed

# Define variables
$projectId = "your-project-id"        # Replace with your GCP Project ID
$zone = "us-central1-a"               # Replace with your desired zone
$instanceName = "my-vm-instance"      # Replace with your VM instance name
$machineType = "e2-micro"             # Replace with your machine type
$imageFamily = "debian-11"            # Replace with your desired image family
$imageProject = "debian-cloud"        # Replace with the image project

# Display input variables
Write-Host "Project ID: $projectId"
Write-Host "Zone: $zone"
Write-Host "Instance Name: $instanceName"
Write-Host "Machine Type: $machineType"
Write-Host "Image Family: $imageFamily"
Write-Host "Image Project: $imageProject"

# Build gcloud command to create a VM
$createVmCommand = @"
gcloud compute instances create $instanceName `
    --project=$projectId `
    --zone=$zone `
    --machine-type=$machineType `
    --image-family=$imageFamily `
    --image-project=$imageProject `
    --boot-disk-size=10GB
"@

# Execute the gcloud command
Write-Host "Creating VM instance '$instanceName' in project '$projectId'..."
Invoke-Expression $createVmCommand

# Check the result
if ($LASTEXITCODE -eq 0) {
    Write-Host "VM instance '$instanceName' created successfully."
} else {
    Write-Host "Failed to create VM instance '$instanceName'."
}
