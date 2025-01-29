# Personal Expense Tracker

This is a **Personal Expense Tracker** application built using **Flask**, **SQLAlchemy**, and a **MSSQL database**. Users can **register**, **log in**, track their **expenses**, and view their **expense history**.

## Features
- **User Registration**: Users can create a new account with a unique email and password.
- **User Login**: Authenticated users can log in with their credentials.
- **Expense Management**: Logged-in users can add new expenses and view their expenses in a dashboard.
- **Security**: Passwords are securely hashed before storing them in the database.
  
## Architecture
The application follows the **MVC (Model-View-Controller)** pattern with a clear separation of concerns:
- **Frontend**: Uses HTML templates for rendering the pages (`Flask` templates) and serves static assets like CSS and JavaScript.
- **Backend**: Built with **Flask**, with routes to handle user registration, login, and expense management.
- **Database**: MSSQL is used as the backend database to store user and expense data.

## Folder Structure

```
personal-expense-tracker/
│── backend/  
│   ├── app.py                   # Initializes the Flask app and registers routes
│   ├── config.py                # Contains configuration settings (DB URI, secret key)
│   ├── models.py                # Defines User and Expense database models
│   ├── routes/                  # Contains route definitions for users and expenses
│   │   ├── user_routes.py
│   │   ├── expense_routes.py
│   ├── services/                # Contains business logic for user and expense management
│   │   ├── user_service.py
│   │   ├── expense_service.py
│   ├── db/                      # Contains database connection logic
│   │   ├── db_connection.py
│   ├── requirements.txt         # Lists the dependencies required for the backend
│   ├── wsgi.py                  # For deploying the app using Gunicorn
│── frontend/
│   ├── static/                  # Contains CSS and JS files
│   │   ├── css/
│   │   │   ├── styles.css
│   │   ├── js/
│   │   │   ├── script.js
│   ├── templates/               # Contains HTML files for user interfaces
│   │   ├── index.html
│   │   ├── dashboard.html
│   │   ├── login.html
│   │   ├── register.html
│   ├── app.py                   # A simple Flask app to serve the frontend
│── scripts/
│   ├── deploy.sh                # Shell script for deployment on GCP VM
│   ├── start_server.sh          # Shell script to start the Flask app with Gunicorn
│── docs/
│   ├── architecture.txt         # Overview of project architecture
│   ├── workflows.txt            # Describes the workflows for user actions
│── README.md                    # This file
```

---

## Prerequisites

Before setting up the project, make sure you have the following installed:

- **Python 3.8+**: The application is built with Python 3.x.
- **MSSQL Server**: The backend database for storing user and expense information.
- **Google Cloud Platform (GCP) Account** (optional, for deployment): If you plan to deploy the app to a GCP VM.

---

## Setup Instructions

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/personal-expense-tracker.git
cd personal-expense-tracker
```

### 2. Set Up Python Environment

Create a virtual environment (recommended):

```bash
python -m venv venv
```

Activate the virtual environment:

- **For Windows**:
  ```bash
  .\venv\Scripts\activate
  ```
- **For macOS/Linux**:
  ```bash
  source venv/bin/activate
  ```

### 3. Install Dependencies

Install the necessary Python packages:

```bash
pip install -r backend/requirements.txt
```

### 4. Configure Database

- Open the `backend/config.py` file and update the database connection string for your MSSQL server. For example:

```python
SQLALCHEMY_DATABASE_URI = 'mssql+pyodbc://username:password@hostname/database_name?driver=ODBC+Driver+17+for+SQL+Server'
```

Make sure to replace `username`, `password`, `hostname`, and `database_name` with the correct values.

### 5. Initialize the Database

The application uses **SQLAlchemy** as the ORM to interact with the MSSQL database. To create the necessary tables in the database, run the following commands:

```bash
python backend/app.py
```

The database tables for **User** and **Expense** models will be created automatically.

---

## Running the Application

### 1. Run the Backend

To run the Flask backend locally:

```bash
python backend/app.py
```

This will start the server, and you should be able to access the application in your browser at `http://localhost:5000`.

### 2. Run the Frontend

The frontend is also served through Flask. The **login**, **registration**, and **dashboard** pages are available by default.

- Access the homepage at `http://localhost:5000`
- Register a new user, log in, and view your expenses on the dashboard.

### 3. Gunicorn (For Production)

For production deployment, it's recommended to use **Gunicorn** as the WSGI server. You can start it with the following command:

```bash
gunicorn -w 4 -b 0.0.0.0:8000 wsgi:app
```

---

## Deployment

To deploy the app on a **Google Cloud Platform (GCP) Virtual Machine (VM)**:

1. Set up a VM on GCP and ensure that it's running.
2. Copy the project files to the VM using `scp` or any other file transfer method.
3. Run the `deploy.sh` script to automate the deployment process:

```bash
./scripts/deploy.sh
```

This script will deploy the app and make it accessible on your VM.

---

## User Flow

1. **User Registration**:
   - A user visits the `register.html` page, enters their details (email, password), and submits the form.
   - The backend creates a new user in the database, hashes the password for security, and stores the user data.

2. **User Login**:
   - After registration, the user can visit the `login.html` page and log in with their email and password.
   - The backend checks the credentials, and if they match, the user is logged in and redirected to the **expense dashboard**.

3. **Expense Management**:
   - Once logged in, the user can add new expenses and view a list of their previous expenses on the **dashboard**.
   - The expense data is stored in the **Expense** table in the database.

---

