from flask import Blueprint, request, jsonify
from models import db, Expense

expense_blueprint = Blueprint("expense_routes", __name__)

@expense_blueprint.route('/add_expense', methods=['POST'])
def add_expense():
    data = request.json
    new_expense = Expense(user_id=data['user_id'], amount=data['amount'], category=data['category'], date=data['date'])
    db.session.add(new_expense)
    db.session.commit()
    return jsonify({"message": "Expense added successfully!"})
