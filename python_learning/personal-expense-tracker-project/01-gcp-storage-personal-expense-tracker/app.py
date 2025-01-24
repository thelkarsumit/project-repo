from flask import Flask, request, render_template, jsonify
from google.cloud import storage
import os

# Flask App Initialization
app = Flask(__name__)

# GCP Connection Test Function
def gcp_connection_test():
    try:
        client = storage.Client()
        buckets = list(client.list_buckets())
        if buckets:
            print(f"Connected to GCP. Buckets: {[bucket.name for bucket in buckets]}")
        else:
            print("Connected to GCP but no buckets found.")
    except Exception as e:
        print(f"Error connecting to GCP: {e}")
        raise e

# Test GCP connection before starting the app
if __name__ == "__main__":
    gcp_connection_test()

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/submit-expense", methods=["POST"])
def submit_expense():
    try:
        # Get data from the form
        name = request.form["name"]
        amount = request.form["amount"]

        # GCP Storage Setup
        bucket_name = "your-bucket-name"
        file_name = "expenses.txt"
        data = f"Name: {name}, Amount: {amount}\n"

        # Upload to GCP Bucket
        client = storage.Client()
        bucket = client.bucket(bucket_name)
        blob = bucket.blob(file_name)

        # Append data to file in GCP bucket
        blob_data = blob.download_as_text() if blob.exists() else ""
        blob.upload_from_string(blob_data + data)

        return jsonify({"message": "Expense submitted successfully!"})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
