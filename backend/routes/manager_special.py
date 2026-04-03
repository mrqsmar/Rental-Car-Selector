import random
from flask import Blueprint, jsonify
from db import query_db

manager_special_bp = Blueprint("manager_special", __name__)


@manager_special_bp.route("/", methods=["POST"])
def get_random_car():
    classes = query_db("SELECT id, code, name FROM vehicle_classes")
    chosen = random.choice(classes)

    vc = query_db(
        "SELECT * FROM vehicle_classes WHERE id = %s",
        (chosen["id"],),
        fetchone=True,
    )
    models = query_db(
        "SELECT id, make, model, trim_level, is_recommended FROM vehicle_models WHERE class_id = %s ORDER BY is_recommended DESC, make",
        (vc["id"],),
    )
    vc["models"] = models

    return jsonify({
        "message": "Since you have picked the Manager's Special, you got a random class of car!",
        "vehicle_class": vc,
    })
