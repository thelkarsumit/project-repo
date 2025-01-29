from backend.db import db
from backend.models import Expense
from datetime import datetime

class ExpenseService:
    @staticmethod
    def add_expense(category, amount, date):
        new_expense = Expense(category=category, amount=amount, date=datetime.strptime(date, '%Y-%m-%d'))
        db.session.add(new_expense)
        db.session.commit()

    @staticmethod
    def get_expenses():
        return Expense.query.all()
