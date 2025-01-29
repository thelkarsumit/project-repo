1. User visits the web app
2. Frontend (HTML/CSS) renders UI
3. User logs in or registers
4. Frontend sends a request to Backend (Flask API)
5. Backend processes request and queries Cloud MySQL
6. Database returns data to Backend
7. Backend sends response to Frontend
8. Frontend displays data to User
9. User can add/update/delete expenses
10. Changes are saved in Cloud MySQL

### **1. First-Time User: Registration Process**

#### **Frontend Flow:**
- The user visits the app's homepage (`index.html`).
- The user clicks on the **"Register"** link, which takes them to the **registration page** (`register.html`).
- On the registration page, the user fills in their **username**, **email**, and **password** and clicks the **"Register"** button.

#### **Backend Flow (User Registration):**
- The `register` route in `user_routes.py` handles the form submission via a **POST** request.
- **Steps taken in the backend**:
  1. The form data is **extracted** (username, email, password).
  2. The `UserService.register_user()` method is called to register the user.
     - Inside `register_user()`, the **password is hashed** using the `generate_password_hash` function from `werkzeug.security` for security.
     - A new `User` object is created with the provided username, email, and hashed password.
     - This new user is **added to the database** using SQLAlchemy (`db.session.add(new_user)`), and the session is committed (`db.session.commit()`).
  3. Once registration is successful, the user is **redirected to the login page** (`user_routes.login()`).

#### **Database Interaction:**
- The new user is stored in the **`User`** model, which represents a table in the database that holds user credentials (hashed passwords, usernames, and emails).

#### **Frontend Feedback:**
- After successful registration, the user is shown a **successful registration message** and a link to log in.

---

### **2. First-Time User: Login Process**

#### **Frontend Flow:**
- The user is now redirected to the **login page** (`login.html`).
- They enter their **email** and **password** and click **"Login"**.

#### **Backend Flow (User Login):**
- The `login` route in `user_routes.py` handles the login form submission via a **POST** request.
  - **Steps taken in the backend**:
    1. The form data (email and password) is **extracted**.
    2. The `UserService.login_user()` method is called to verify the user's credentials.
       - Inside `login_user()`, the application queries the **database** to check if the **email exists** using `User.query.filter_by(email=email).first()`.
       - If the user is found, the **password hash stored in the database** is compared with the password entered by the user using `check_password_hash()` from `werkzeug.security`.
       - If the **password is correct**, the user is **authenticated**.
    3. After a successful login, the user is redirected to the **expense dashboard** (`expense_routes.dashboard()`), where they can see their expenses.

#### **Database Interaction:**
- The login process queries the `User` table to find a user based on the email provided. If the email matches, it checks the password by comparing the hashed version in the database.

#### **Frontend Feedback:**
- If the login is successful, the user is redirected to their **dashboard** page where they can view their expenses.
- If the login fails (incorrect password or email), the user will be shown an **error message** (e.g., "Invalid email or password").

---

### **3. Subsequent User Login (After First-Time)**

#### **Frontend Flow (Repeat Login):**
- The user visits the app and clicks **"Login"**.
- They enter their **email** and **password** again.

#### **Backend Flow (Subsequent Logins):**
- The flow is almost the same as the first-time login:
  1. The application **queries the `User` table** based on the provided email.
  2. The application **compares the entered password** with the hashed password stored in the database.
  3. If the credentials are correct, the user is **authenticated** and redirected to the **dashboard** page.

- **No registration** process is needed on subsequent logins. The user is directly authenticated based on their stored credentials.

#### **Backend Data Handling:**
- **No new data** is added during subsequent logins (only the query process occurs).
- The **user’s session or authentication state** is maintained via Flask (typically using **sessions or JWT** tokens, but this part is simplified here for explanation).

---

### **Session Handling (Key Backend Process)**

**For both registration and login**, the app can implement a **session mechanism** to keep track of the user. A session is a way to store information (like the logged-in user) between requests. Here's a quick breakdown:

- When the user logs in, Flask can store their user **ID in the session**.
  - This ensures that subsequent requests can be tied to the specific user without requiring them to log in each time they visit the site.
- The user’s **ID or authentication state** can be stored in the session using `session['user_id']` after a successful login.

For example:

```python
# In user_routes.py, after successful login:
session['user_id'] = user.id  # Store user id in session
```

Then, on subsequent pages (like the **dashboard**), the app can check if the session exists to ensure the user is logged in.

```python
# On pages like dashboard:
if 'user_id' not in session:
    return redirect(url_for('user_routes.login'))  # If not logged in, redirect to login page
```

---

### **4. Dashboard / Expense Management Process**

After logging in successfully:

1. The user is directed to their **dashboard** (`dashboard.html`).
2. The `dashboard()` function in `expense_routes.py` retrieves all the **expenses** for the user from the database.
   - This is done through the `ExpenseService.get_expenses()` method, which queries the `Expense` table.
3. The **expenses are displayed** on the dashboard in a table format.
   - If the user wants to add a new expense, they can click a link that takes them to the **add expense page** (`add_expense.html`).
4. On the add expense page, the user can input the **category**, **amount**, and **date** of the expense.
5. After submitting the form, the `ExpenseService.add_expense()` method is called to add the new expense to the database.
   - The user is then redirected back to the dashboard to view the updated list of expenses.

---

### **5. Logout Process (Optional)**

If the user decides to log out:

- The session is **cleared** (i.e., `session.pop('user_id')`) to remove any stored authentication state.
- The user is redirected to the **login page**.

---

### **Summary Workflow (First and Subsequent Logins)**

1. **First-Time Registration:**
   - User fills in registration form → Data is saved to the database → User is redirected to login page.
   
2. **First-Time Login:**
   - User enters login credentials → Backend authenticates user → User is redirected to dashboard.
   
3. **Subsequent Logins:**
   - User enters login credentials → Backend authenticates user → User is redirected to dashboard.
   
4. **Dashboard / Expense Management:**
   - After login, the user can add/view expenses from the dashboard.

5. **Session Handling:**
   - Flask sessions are used to keep track of the logged-in user.

---
