from flask import Blueprint, request, jsonify
from models import db, User

user_blueprint = Blueprint("user_routes", __name__)

@user_blueprint.route('/register', methods=['POST'])
def register():
    data = request.json
    new_user = User(username=data['username'], password=data['password'])
    db.session.add(new_user)
    db.session.commit()
    return jsonify({"message": "User registered successfully!"})
