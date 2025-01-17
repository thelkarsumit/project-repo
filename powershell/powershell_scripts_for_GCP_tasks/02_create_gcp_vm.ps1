# This script creates a Google Cloud VM instance using the gcloud CLI.
# Prerequisites:
# - Google Cloud CLI (gcloud) installed
# - Authentication to GCP is completed

# Define variables
$projectId = "shyamkprj"              # Replace with your GCP Project ID
$zone = "africa-south1-a"             # Replace with your desired zone
$instanceName = "powersheell-vm"      # Replace with your VM instance name
$machineType = "e2-micro"             # Replace with your machine type
$imageFamily = "debian-11"            # Replace with your desired image family
$imageProject = "debian-cloud"        # Replace with the image project
$network = "default"                  # Replace with your desired network
$subnetwork = "default"               # Replace with your desired subnetwork

# Display input variables
Write-Host "Project ID: $projectId"
Write-Host "Zone: $zone"
Write-Host "Instance Name: $instanceName"
Write-Host "Machine Type: $machineType"
Write-Host "Image Family: $imageFamily"
Write-Host "Image Project: $imageProject"

# Command to create VM
Write-Host "Creating VM instance '$instanceName' in project '$projectId'..."

# Use Start-Process to call the gcloud command directly
Start-Process gcloud -ArgumentList @(
    "compute", "instances", "create", $instanceName,
    "--project=$projectId",
    "--zone=$zone",
    "--machine-type=$machineType",
    "--image-family=$imageFamily",
    "--image-project=$imageProject",
    "--network=$network",
    "--subnet=$subnetwork",
    "--boot-disk-size=10GB"
) -Wait

# Check the result
if ($LASTEXITCODE -eq 0) {
    Write-Host "VM instance '$instanceName' created successfully."
} else {
    Write-Host "Failed to create VM instance '$instanceName'."
