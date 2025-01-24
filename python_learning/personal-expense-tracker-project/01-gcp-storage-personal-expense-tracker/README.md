# Personal Expense Tracker

A simple web-based application to track personal expenses, hosted on Google Cloud Platform (GCP) VM. This project uses Python with Flask for the backend, HTML for the frontend, and Google Cloud Storage for storing expense data.

---

## Folder Structure

```
personal-expense-tracker/
│
├── app.py                      # Main Flask application
├── templates/                  # Directory for HTML templates
│   └── index.html              # Frontend for expense submission
├── requirements.txt            # Python dependencies
├── README.md                   # Project documentation
└── credentials.json            # GCP service account key (not committed to Git)
```

---

## Architecture

```
User Browser
    |
    |--(HTTP Request)--> [Flask Application on GCP VM]
                                |
                                |--(Processes Form Data)
                                |--(Stores Data as JSON in GCP Storage Bucket)
                                |
    <--(HTTP Response)--[Flask Application sends confirmation back]
```

---

## Project Explanation

### Objective
The "Personal Expense Tracker" allows users to:
1. Submit expense details (name, amount, category, and date) via a web form.
2. Store the submitted data securely in a GCP Storage bucket as a JSON file.
3. Retrieve the file's public URL as confirmation.

### Components
- **Frontend**: A simple HTML form (`index.html`) that collects expense data.
- **Backend**: A Flask application (`app.py`) to process the data and upload it to GCP Storage.
- **Cloud Storage**: GCP Storage bucket to store expense data as JSON files.
- **Hosting**: Hosted on a GCP Virtual Machine.

---

## Workflow

1. **User Interaction**:
   - The user accesses the web app hosted on the GCP VM and submits expense details through the HTML form.

2. **Form Submission**:
   - The form sends the data via an HTTP POST request to the Flask app.

3. **Data Processing**:
   - The Flask app validates the input and formats it into a JSON object.

4. **Storage**:
   - The JSON data is uploaded to a GCP Storage bucket using the GCP Storage API.
   - Each file is uniquely named using a UUID to prevent conflicts.

5. **Response**:
   - The app returns a confirmation message with the public URL of the uploaded file.

---

## Prerequisites

1. **GCP Account**: Set up a Google Cloud account.
2. **Service Account**: Create a service account with access to GCP Storage and download the key file (`credentials.json`).
3. **GCP VM**: Create a GCP VM instance and allow HTTP/HTTPS traffic.

---

## Deployment Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/personal-expense-tracker.git
   cd personal-expense-tracker
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Set the GCP credentials environment variable:
   ```bash
   export GOOGLE_APPLICATION_CREDENTIALS="path/to/credentials.json"
   ```

4. Run the application:
   ```bash
   python app.py
   ```

5. Access the app in your browser:
   ```
   http://<GCP_VM_EXTERNAL_IP>:8080
   ```

---

## Future Enhancements

1. Add user authentication for secure access.
2. Implement a database for more structured and scalable data storage.
3. Build an admin panel for managing expenses.
4. Introduce visual analytics for expense reports.