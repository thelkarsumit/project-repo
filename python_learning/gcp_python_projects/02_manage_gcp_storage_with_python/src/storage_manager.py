from google.cloud import storage
from google.oauth2 import service_account
import json

# Load configuration from config file
with open('config/storage_config.json') as config_file:
    config = json.load(config_file)

# Initialize Google Cloud Storage client with the service account credentials
def get_storage_client():
    return storage.Client(credentials=service_account.Credentials.from_service_account_file(config['service_account_key']))

# Function to create a new storage bucket
def create_bucket(bucket_name):
    storage_client = get_storage_client()
    bucket = storage_client.create_bucket(bucket_name)
    print(f"Bucket {bucket.name} created successfully!")

# Function to upload a file to the bucket
def upload_blob(bucket_name, source_file_name, destination_blob_name):
    storage_client = get_storage_client()
    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)
    blob.upload_from_filename(source_file_name)
    print(f"File {source_file_name} uploaded to {destination_blob_name}.")

# Function to list all objects in a bucket
def list_blobs(bucket_name):
    storage_client = get_storage_client()
    blobs = storage_client.list_blobs(bucket_name)
    print(f"Objects in bucket {bucket_name}:")
    for blob in blobs:
        print(blob.name)

# Example usage
if __name__ == '__main__':
    # Create a new bucket
    create_bucket(config['bucket_name'])
    
    # Upload a file to the bucket
    upload_blob(config['bucket_name'], config['source_file'], config['destination_blob'])
    
    # List all files in the bucket
    list_blobs(config['bucket_name'])
