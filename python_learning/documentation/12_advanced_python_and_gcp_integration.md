# Advanced Python and GCP Integration.

---

## **Chapter Overview:**
This chapter focuses on advanced Python integration with Google Cloud Platform (GCP). It goes beyond the basic resource management and dives into more complex GCP services like Pub/Sub, BigQuery, and using Python to manage resources via APIs. It also covers automating GCP tasks, handling authentication, and error handling when interacting with GCP services through Python.

By the end of this chapter, you’ll be able to use Python to automate GCP tasks efficiently, interact with various GCP services, and apply best practices for error handling.

---

### **Table of Contents:**
1. **Introduction to Advanced GCP Python Integration**
2. **Using Python with GCP APIs (Pub/Sub, BigQuery, etc.)**
3. **Authentication in GCP with Python**
4. **Automating GCP Resource Provisioning with Python**
5. **Error Handling for GCP API Calls in Python**
6. **Creating Custom GCP Services Using Python (Cloud Functions, Cloud Run)**
7. **Best Practices for Managing GCP Resources with Python**

---

### **1. Introduction to Advanced GCP Python Integration**

In this section, we’ll start by understanding how Python can interact with different advanced GCP services. While basic tasks like creating VMs or uploading files to Cloud Storage are commonly done with Python, we will explore more complex services, such as:

- Google Cloud Pub/Sub for messaging.
- BigQuery for data analytics.
- Interacting with GCP APIs using Python.

We'll also touch on the essential libraries that enable Python to communicate with GCP.

---

### **2. Using Python with GCP APIs (Pub/Sub, BigQuery, etc.)**

#### **Using Python with Google Cloud Pub/Sub**

Google Cloud Pub/Sub is a messaging service that allows you to send and receive messages between independent applications. You can use Python to publish and subscribe to messages in real-time. Below is an example of how to interact with Pub/Sub using Python.

**Installation**:
```bash
pip install google-cloud-pubsub
```

**Publishing a message to a topic**:
```python
from google.cloud import pubsub_v1

# Set up Pub/Sub client
publisher = pubsub_v1.PublisherClient()
project_id = 'your-project-id'
topic_id = 'your-topic-id'
topic_path = publisher.topic_path(project_id, topic_id)

# Publish a message
message = 'Hello, Pub/Sub from Python!'
message_data = message.encode('utf-8')
future = publisher.publish(topic_path, message_data)

print(f'Published message ID: {future.result()}')
```

**Subscribing to a topic**:
```python
from google.cloud import pubsub_v1

# Set up subscriber client
subscriber = pubsub_v1.SubscriberClient()
subscription_id = 'your-subscription-id'
subscription_path = subscriber.subscription_path(project_id, subscription_id)

def callback(message):
    print(f"Received message: {message.data.decode('utf-8')}")
    message.ack()

# Listen for messages
subscriber.subscribe(subscription_path, callback=callback)

# Keep the main thread alive to receive messages
import time
while True:
    time.sleep(60)
```

#### **Using Python with Google BigQuery**

BigQuery is a fully managed data warehouse that supports super-fast SQL queries using the processing power of Google's infrastructure. Here’s how to use Python to interact with BigQuery.

**Installation**:
```bash
pip install google-cloud-bigquery
```

**Inserting data into a BigQuery table**:
```python
from google.cloud import bigquery

# Initialize BigQuery client
client = bigquery.Client()

# Define the dataset and table
dataset_id = 'your_dataset_id'
table_id = 'your_table_id'

# Prepare data to be inserted
rows_to_insert = [
    {u"column1": "value1", u"column2": 123},
    {u"column1": "value2", u"column2": 456}
]

# Insert data into BigQuery
errors = client.insert_rows_json(f'{dataset_id}.{table_id}', rows_to_insert)

if errors:
    print(f'Errors occurred while inserting rows: {errors}')
else:
    print('Data inserted successfully.')
```

---

### **3. Authentication in GCP with Python**

To interact with GCP services, authentication is required. The recommended approach is using **service accounts**. Here's how to set up authentication.

#### **Service Account Authentication**:
1. **Create a Service Account**: In the GCP Console, go to the IAM & Admin section, create a new service account, and assign it the necessary permissions.
2. **Download the JSON Key**: Once the service account is created, download the JSON key file.

**Setting Up Authentication**:
```python
import os
from google.cloud import storage

# Set the environment variable for authentication
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/path/to/service-account-file.json"

# Example: Interacting with Cloud Storage
client = storage.Client()
buckets = list(client.list_buckets())

for bucket in buckets:
    print(f"Bucket: {bucket.name}")
```

This authentication method allows your Python script to authenticate without manually providing credentials each time.

---

### **4. Automating GCP Resource Provisioning with Python**

You can automate the creation, modification, and deletion of GCP resources using Python.

#### **Example: Create a VM Instance**:
```python
from google.cloud import compute_v1

def create_instance(project, zone, instance_name):
    instance_client = compute_v1.InstancesClient()
    instance = compute_v1.Instance()
    instance.name = instance_name
    instance.machine_type = f"zones/{zone}/machineTypes/n1-standard-1"
    instance.network_interfaces = [compute_v1.NetworkInterface(access_configs=[compute_v1.AccessConfig(type_=compute_v1.AccessConfig.Type.ONE_TO_ONE_NAT)])]

    operation = instance_client.insert(project=project, zone=zone, instance_resource=instance)
    operation.result()  # Wait for the operation to complete

    print(f"VM instance {instance_name} created.")

# Call function to create a VM
create_instance('your-project-id', 'us-central1-a', 'new-instance')
```

This can be extended to include disk creation, configuring firewalls, and more.

---

### **5. Error Handling for GCP API Calls in Python**

Error handling is crucial when interacting with GCP APIs. You must anticipate potential issues like authentication errors, quota limits, and invalid input.

Example of handling errors in API calls:
```python
from google.api_core.exceptions import GoogleAPICallError, NotFound

try:
    # Some GCP API call
    result = client.some_api_method()
except GoogleAPICallError as e:
    print(f"API call failed: {e}")
except NotFound as e:
    print(f"Resource not found: {e}")
```

---

### **6. Creating Custom GCP Services Using Python (Cloud Functions, Cloud Run)**

#### **Cloud Functions**:
Cloud Functions allows you to run small pieces of code (functions) in response to events. You can write Python code to handle HTTP requests or trigger events in GCP.

**Example**: Create a simple HTTP-triggered function:
```python
def hello_world(request):
    return 'Hello, World from Python Cloud Function!'
```

Deploying the function to Cloud Functions:
```bash
gcloud functions deploy hello_world --runtime python310 --trigger-http
```

#### **Cloud Run**:
Cloud Run allows you to run containers on GCP. You can create a Python app, dockerize it, and deploy it to Cloud Run.

---

### **7. Best Practices for Managing GCP Resources with Python**

1. **Use Service Accounts**: Always authenticate using service accounts with the least privilege principle.
2. **Modularize Your Code**: Break down your code into reusable functions and modules.
3. **Use Environment Variables**: Store sensitive information like API keys in environment variables or secrets management tools.
4. **Handle Errors Gracefully**: Ensure all GCP API interactions have error handling, including retries and backoff strategies.

---