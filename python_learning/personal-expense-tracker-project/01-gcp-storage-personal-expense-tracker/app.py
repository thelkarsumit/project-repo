from flask import Flask, render_template, request, redirect
from google.cloud import storage
import uuid
import json

app = Flask(__name__)
BUCKET_NAME = "sumit-shyamkprj"

# Initialize GCP Storage Client
client = storage.Client()

def upload_to_bucket(data):
    """Upload JSON data to GCP Storage bucket."""
    bucket = client.get_bucket(BUCKET_NAME)
    blob = bucket.blob(f"expense-{uuid.uuid4().hex}.json")
    blob.upload_from_string(json.dumps(data), content_type="application/json")
    return blob.public_url

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit_expense():
    if request.method == 'POST':
        # Collect expense data from the form
        name = request.form.get('name')
        amount = request.form.get('amount')
        category = request.form.get('category')
        date = request.form.get('date')
        
        # Create expense dictionary
        expense_data = {
            "name": name,
            "amount": amount,
            "category": category,
            "date": date
        }
        
        # Upload to GCP Storage
        file_url = upload_to_bucket(expense_data)
        return f"Expense saved successfully! <a href='/'>Go back</a><br>File URL: {file_url}"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
