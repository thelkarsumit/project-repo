# 05_delete_gcp_vm.ps1
# This script deletes a Google Cloud VM instance using the gcloud CLI.
# Prerequisites:
# - Google Cloud CLI (gcloud) installed
# - Authentication to GCP is completed

# Define variables
$projectId = "shyamkprj"              # Replace with your GCP Project ID
$zone = "africa-south1-a"             # Replace with your desired zone
$instanceName = "powersheell-vm"      # Replace with the VM instance name to delete

# Display input variables
Write-Host "Project ID: $projectId"
Write-Host "Zone: $zone"
Write-Host "Instance Name: $instanceName"

# Command to delete the VM instance
Write-Host "Deleting VM instance '$instanceName' from project '$projectId'..."

# Use Start-Process to call the gcloud command directly for deletion
Start-Process gcloud -ArgumentList @(
    "compute", "instances", "delete", $instanceName,
    "--project=$projectId",
    "--zone=$zone",
    "--quiet"   # --quiet avoids asking for confirmation
) -Wait

# Check the result
if ($LASTEXITCODE -eq 0) {
    Write-Host "VM instance '$instanceName' deleted successfully."
} else {
    Write-Host "Failed to delete VM instance '$instanceName'."
}

