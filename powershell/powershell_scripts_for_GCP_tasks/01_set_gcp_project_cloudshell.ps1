# Define the project name and ID
$projectName = "shyamkprj"
$projectID = "shyamkprj"

# Set the project as the active project for future operations
gcloud config set project $projectID
Write-Host "Project $projectName is now active."

$projects = gcloud projects list --format="table(projectId, name, projectNumber, lifecycleState)"
Write-Host "Google Project"
Write-Output $projects