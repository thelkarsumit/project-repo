from flask import Flask
from routes.user_routes import user_blueprint
from routes.expense_routes import expense_blueprint
from db.db_connection import init_db

app = Flask(__name__)

# Initialize Database
init_db(app)

# Register Blueprints (Routes)
app.register_blueprint(user_blueprint)
app.register_blueprint(expense_blueprint)

if __name__ == "__main__":
    app.run(debug=True)  # Run Flask App
