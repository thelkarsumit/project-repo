from flask import Blueprint, request, render_template, redirect, url_for
from backend.services import UserService

user_routes = Blueprint('user_routes', __name__)

# Registration route
@user_routes.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        UserService.register_user(username, email, password)
        return redirect(url_for('user_routes.login'))
    return render_template('register.html')

# Login route
@user_routes.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        if UserService.login_user(email, password):
            return redirect(url_for('expense_routes.dashboard'))
    return render_template('login.html')
