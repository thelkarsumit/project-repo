from flask import Flask, render_template, request, redirect, url_for
from google.cloud import storage
import os

app = Flask(__name__)

client = storage.Client()
bucket_name = "sumit-shyamkprj"
bucket = client.get_bucket(bucket_name)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/add_expense', methods=['POST'])
def add_expense():
    try:
        if request.method == 'POST':
            name = request.form['name']
            amount = request.form['amount']
            description = request.form['description']
            
            # Log the form data
            print(f"Received data: Name={name}, Amount={amount}, Description={description}")
            
            # Save data to GCP Storage bucket
            blob = bucket.blob(f"{name}_{amount}.txt")
            blob.upload_from_string(f"Name: {name}\nAmount: {amount}\nDescription: {description}")
            
            return redirect(url_for('index'))
    except Exception as e:
        print(f"Error occurred: {e}")
        return "Internal Server Error", 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)
