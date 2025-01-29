import os

DB_HOST = os.getenv("DB_HOST", "your-cloud-sql-host")
DB_USER = os.getenv("DB_USER", "your-db-user")
DB_PASSWORD = os.getenv("DB_PASSWORD", "your-db-password")
DB_NAME = os.getenv("DB_NAME", "expense_tracker")
SECRET_KEY = os.getenv("SECRET_KEY", "your-secret-key")
