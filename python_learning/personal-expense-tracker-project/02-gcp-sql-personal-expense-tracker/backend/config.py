import os

class Config:
    SECRET_KEY = os.getenv('SECRET_KEY', 'your_secret_key_here')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    # MSSQL connection string
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'mssql+pyodbc://username:password@your_mssql_server/database_name?driver=ODBC+Driver+17+for+SQL+Server')
