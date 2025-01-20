from google.cloud import resourcemanager_v3
from google.oauth2 import service_account
import json

# Load configuration from file
with open('config/gcp_config.json') as config_file:
    config = json.load(config_file)

def create_gcp_project(project_id, name):
    """Creates a new Google Cloud Project"""
    
    # Initialize the GCP Resource Manager client
    client = resourcemanager_v3.ProjectsClient(credentials=service_account.Credentials.from_service_account_file(config['service_account_key']))
    
    # Define the project configuration
    project = resourcemanager_v3.Project(
        project_id=project_id, 
        name=name
    )
    
    # Create the project and wait for the operation to complete
    operation = client.create_project(project=project)
    operation.result()  # Wait until the project is created
    
    print(f"Project '{name}' with ID '{project_id}' created successfully!")

# Call the function using data from the config
create_gcp_project(config['project_id'], config['project_name'])
