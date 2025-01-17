# 04_create_gcp_vm.ps1
# This script creates a Google Cloud VM instance using the gcloud CLI.
# Prerequisites:
# - Google Cloud CLI (gcloud) installed
# - Authentication to GCP is completed

#Define variable
$projectID      = "shyamkprg"
$zone           = "africa-south1-a"
$instance-name  = "powersheell-vm"
$network        = "default"
$subnetwork     = "default"
$machine-type   = "e2-micro" 
$image          = "debian-11"

#Display variable value
write-host projectID $projectID
write-host zone $zone
write-host instance-name $instance-name
write-host network $network
write-host subnetwork $subnetwork
write-host machine-type $machine-type
write-host image $image

# Build gcloud command to create a VM
$createVmCommand = @"
gcloud compute instances create $instance-name `
    --project=$projectID `
    --zone=$zone `
    --machine-type=$machine-type `
    --image-family=$image ``
    --boot-disk-size=10GB
"@

# Execute the gcloud command
Write-Host "Creating VM instance '$instance-name' in project '$projectID'..."
Invoke-Expression $createVmCommand

# Check the result
if ($LASTEXITCODE -eq 0) {
    Write-Host "VM instance '$instance-name' created successfully."
} else {
    Write-Host "Failed to create VM instance '$instance-name'."
}



