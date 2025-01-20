### **Chapter 11: Python Scripts for GCP**  
**File Name**: `11_python_scripts_for_gcp.md`

---

#### **Overview:**
In this chapter, we'll explore how to write Python scripts that interact with Google Cloud Platform (GCP). Using Python, you can automate tasks like creating resources, managing services, uploading and downloading data, and performing administrative functions on GCP. We will cover how to interact with key GCP services such as Compute Engine, Cloud Storage, and IAM, and walk through examples that demonstrate how to automate common GCP tasks.

---

### **1. Setting Up GCP and Python Environment**

Before writing Python scripts to interact with GCP, ensure you have the following:
1. **Google Cloud SDK**: Install the Google Cloud SDK on your machine to authenticate with GCP.
   - [GCP SDK Installation Guide](https://cloud.google.com/sdk/docs/install)
   
2. **Google Cloud Python Client**: Install the `google-cloud` Python library to interact with GCP services.
   ```bash
   pip install --upgrade google-cloud
   ```

3. **Service Account**: Set up a service account with the required permissions (for example, Compute Engine Admin or Storage Admin) and download the JSON key for authentication.

4. **Authenticate with GCP**: Use the service account credentials to authenticate your script.
   ```bash
   export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your-service-account-key.json"
   ```

---

### **2. Writing Python Scripts for GCP**

We will now look at how to use Python scripts to interact with different GCP services.

---

#### **Example 1: Creating a VM on GCP (Compute Engine)**

You can use Python to create virtual machines on GCP. Below is an example of how to create a VM instance using the `google-cloud-compute` library.

##### **Installation**:
Install the `google-cloud-compute` library:
```bash
pip install google-cloud-compute
```

##### **Code**:
```python
from google.cloud import compute_v1
from google.oauth2 import service_account

def create_instance(project, zone, instance_name):
    instance_client = compute_v1.InstancesClient()
    
    # Define the VM instance
    instance = compute_v1.Instance()
    instance.name = instance_name
    instance.machine_type = f"zones/{zone}/machineTypes/n1-standard-1"
    instance.zone = f"projects/{project}/zones/{zone}"

    # Set the disk configuration
    disk = compute_v1.AttachedDisk()
    disk.boot = True
    disk.auto_delete = True
    disk.initialize_params.source_image = "projects/debian-cloud/global/images/family/debian-10"
    instance.disks = [disk]
    
    # Set the network interface
    network_interface = compute_v1.NetworkInterface()
    network_interface.network = "global/networks/default"
    instance.network_interfaces = [network_interface]

    # Create the instance
    operation = instance_client.insert(project=project, zone=zone, instance_resource=instance)

    # Wait for the operation to complete
    operation.result()
    print(f"Instance {instance_name} created successfully!")

# Example usage
create_instance('your-project-id', 'us-central1-a', 'my-python-vm')
```

##### **Explanation**:
- We use the `compute_v1.InstancesClient` to interact with Compute Engine resources.
- The script creates a VM with a basic configuration, such as a Debian image and `n1-standard-1` machine type.
- The `operation.result()` method waits for the creation to complete.

---

#### **Example 2: Uploading Files to Google Cloud Storage**

Google Cloud Storage allows you to store and manage data on the cloud. Let's see how to upload a file from your local machine to a Cloud Storage bucket.

##### **Installation**:
Install the `google-cloud-storage` library:
```bash
pip install google-cloud-storage
```

##### **Code**:
```python
from google.cloud import storage

def upload_file_to_gcs(bucket_name, source_file_name, destination_blob_name):
    storage_client = storage.Client()

    # Get the bucket
    bucket = storage_client.get_bucket(bucket_name)

    # Upload the file
    blob = bucket.blob(destination_blob_name)
    blob.upload_from_filename(source_file_name)

    print(f"File {source_file_name} uploaded to {destination_blob_name}.")

# Example usage
upload_file_to_gcs('your-bucket-name', 'local-file.txt', 'uploaded-file.txt')
```

##### **Explanation**:
- The script uses `google-cloud-storage` to upload a file (`source_file_name`) to a specified Cloud Storage bucket (`bucket_name`).
- The `blob.upload_from_filename()` method uploads the file to the bucket.

---

#### **Example 3: Managing IAM Roles and Permissions**

You can use Python to manage IAM roles and permissions for GCP resources. For example, let's assign a role to a service account.

##### **Installation**:
Install the `google-cloud-iam` library:
```bash
pip install google-cloud-iam
```

##### **Code**:
```python
from google.cloud import iam_v1

def assign_role_to_service_account(project_id, service_account_email, role):
    client = iam_v1.IAMPolicyClient()
    
    # Get the current policy
    policy = client.get_iam_policy(resource=f"projects/{project_id}")

    # Define the binding (role assignment)
    binding = iam_v1.Binding()
    binding.role = role
    binding.members.append(f"serviceAccount:{service_account_email}")

    # Add the binding to the policy
    policy.bindings.append(binding)
    
    # Set the policy
    client.set_iam_policy(resource=f"projects/{project_id}", policy=policy)
    print(f"Role {role} assigned to service account {service_account_email}")

# Example usage
assign_role_to_service_account('your-project-id', 'service-account@your-project-id.iam.gserviceaccount.com', 'roles/editor')
```

##### **Explanation**:
- The script interacts with IAM policies to assign roles to service accounts.
- The `set_iam_policy()` method is used to apply the new policy.

---

### **3. Automating Cloud Resources**

Python scripts can be used to automate repetitive tasks on GCP. For example:
- **Scaling Compute Engine instances**: Write Python scripts to auto-scale your VM instances based on demand.
- **Backup Automation**: Create Python scripts to back up Cloud Storage data on a schedule.

---

### **4. Advanced Python & GCP Integration**

For more advanced integrations, you can:
- Use Python to interact with the Google Cloud API for services like **BigQuery**, **Pub/Sub**, and **Cloud Functions**.
- Implement asynchronous calls to handle GCP operations in parallel for better performance.
- Integrate Python with Cloud monitoring tools (e.g., Stackdriver) to automate resource monitoring.

---

### **5. Error Handling and Logging**

When writing Python scripts to interact with GCP, it's important to include error handling and logging for debugging and production-grade reliability.

##### **Example**:
```python
import logging
from google.cloud import storage

logging.basicConfig(level=logging.INFO)

def upload_file_with_logging(bucket_name, source_file_name, destination_blob_name):
    try:
        storage_client = storage.Client()
        bucket = storage_client.bucket(bucket_name)
        blob = bucket.blob(destination_blob_name)
        blob.upload_from_filename(source_file_name)
        logging.info(f"File {source_file_name} uploaded to {destination_blob_name}.")
    except Exception as e:
        logging.error(f"Error occurred: {e}")

# Example usage
upload_file_with_logging('your-bucket-name', 'local-file.txt', 'uploaded-file.txt')
```

- The `logging` module is used to log success and failure messages.
- Exception handling helps catch and log any errors during the execution.

---

### **Conclusion**

In this chapter, we’ve covered how to interact with key GCP services (Compute Engine, Cloud Storage, IAM) using Python scripts. These scripts can be used to automate tasks, manage resources, and integrate GCP services into your Python applications. As you move forward, you can expand this knowledge to cover more advanced GCP services and integrate them into your Python workflow.

---

Let me know if you'd like to dive deeper into any section or example!