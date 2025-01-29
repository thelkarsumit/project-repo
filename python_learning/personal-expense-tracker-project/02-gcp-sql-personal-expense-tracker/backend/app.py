from flask import Flask
from backend.routes import user_routes, expense_routes

app = Flask(__name__)

# Register blueprints for routes
app.register_blueprint(user_routes)
app.register_blueprint(expense_routes)

if __name__ == "__main__":
    app.run(debug=True)
