from flask import Blueprint, request, render_template
from backend.services import ExpenseService

expense_routes = Blueprint('expense_routes', __name__)

# Dashboard route to show expenses
@expense_routes.route('/dashboard')
def dashboard():
    expenses = ExpenseService.get_expenses()
    return render_template('dashboard.html', expenses=expenses)

# Add expense route
@expense_routes.route('/add-expense', methods=['GET', 'POST'])
def add_expense():
    if request.method == 'POST':
        category = request.form['category']
        amount = request.form['amount']
        date = request.form['date']
        ExpenseService.add_expense(category, amount, date)
        return redirect(url_for('expense_routes.dashboard'))
    return render_template('add_expense.html')
