# Create Google Cloud Project with Python

## Task Overview

This Python script demonstrates how to programmatically create a new Google Cloud Project using Google Cloud's Python client libraries. The script interacts with the **Google Cloud Resource Manager API** to create a project in your Google Cloud account.

## Folder Structure

Here is the folder structure for this task:

```
create_gcp_project_with_python/
│
├── src/
│   └── create_project.py # The Python script that creates the GCP project
├── requirements.txt      # Required Python libraries 
├── config/
│   └── gcp_config.json   # Configuration file containing project details and credentials 
├── README.md             # Documentation for usage and setup
└── setup.py              # Setup file for the Python project
```

### 1. **`create_project.py`** - The Main Script

This Python script leverages the **Google Cloud Resource Manager API** to create a new Google Cloud project. The script performs the following tasks:
- Loads the configuration settings from the `gcp_config.json` file.
- Uses the `google-cloud-resource-manager` client to create the project with the provided `project_id` and `project_name`.
- Prints a success message once the project creation is completed.

#### Key Libraries Used:
- **google-cloud-resource-manager**: The main client used for interacting with the Google Cloud Resource Manager API.
- **google-auth**: Handles authentication with GCP using a service account key.
- **google-api-python-client**: Provides the tools for interacting with Google APIs.

### 2. **`gcp_config.json`** - Configuration File

This file contains essential information for creating the GCP project, including:
- `project_id`: The unique ID you want to assign to your new Google Cloud project.
- `project_name`: The name you want to give to the project.
- `service_account_key`: The path to your service account key JSON file, which will authenticate the API requests.

**Important**: You must replace the placeholders (`your-project-id`, `your-project-name`, and `path/to/your/service-account-key.json`) with actual values.

### 3. **`requirements.txt`** - Dependencies

This file lists the Python libraries required to run the project:
- `google-cloud-resource-manager`: To interact with the Google Cloud Resource Manager API.
- `google-auth`: To authenticate with Google Cloud using a service account.
- `google-api-python-client`: To manage interactions with the Google Cloud APIs.

You can install the dependencies with the following command:

```bash
pip install -r requirements.txt
```

### 4. **setup.py** - Setup File
This file enables the Python project to be installed as a module and ensures that the necessary dependencies are included when the project is used as part of another Python project.

To install the module, you can use:

```bash
python setup.py install
```
- **1** How to Run the Script
Install the required dependencies:

```bash
pip install -r requirements.txt
```
- **2** Replace the values in gcp_config.json with your actual GCP project ID, project name, and service account key path.

- **3** Run the script to create your Google Cloud project:

bash
```
python src/create_project.py
```

### 5. Expected Output
Once the script is executed successfully, you will see a message indicating that the project was created:

```csharp
Project 'Your GCP Project' with ID 'your-project-id' created successfully!
```

### 6. Error Handling
If there are any issues (e.g., incorrect service account credentials or insufficient permissions), the script will throw an error, and you will need to address the issue (e.g., check IAM roles, service account permissions, etc.).


### Conclusion
This task demonstrates how to use Python to create a Google Cloud project programmatically. The code is modular, allowing you to reuse it across different projects by adjusting the gcp_config.json file. By following the steps outlined in this guide, you can easily automate the creation of new projects within your Google Cloud account.

---

### Summary:
- **Folder Structure**: Organized into folders (`src/`, `config/`) for modularity.
- **Code**: Python code to interact with the GCP Resource Manager API.
- **Config File**: JSON config file to manage project-specific details.
- **Requirements**: Lists required libraries.
- **Setup**: A `setup.py` for modular project integration.
- **README**: Detailed explanation for setup, usage, and best practices.

---
