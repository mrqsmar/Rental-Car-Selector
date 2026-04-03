from flask import Blueprint, jsonify, request
from db import query_db

rewards_bp = Blueprint("rewards", __name__)


@rewards_bp.route("/", methods=["GET"])
def rewards_info():
    return jsonify({
        "message": "Since you are a rewards member, you can pick any car class to rent from.",
        "description": "Rewards members have access to every vehicle class in our fleet.",
    })


@rewards_bp.route("/select", methods=["POST"])
def rewards_select():
    data = request.get_json()
    code = data.get("code", "").upper()

    vc = query_db(
        "SELECT * FROM vehicle_classes WHERE code = %s",
        (code,),
        fetchone=True,
    )
    if not vc:
        return jsonify({"error": "Invalid vehicle class code"}), 400

    models = query_db(
        "SELECT id, make, model, trim_level, is_recommended FROM vehicle_models WHERE class_id = %s ORDER BY is_recommended DESC, make",
        (vc["id"],),
    )
    vc["models"] = models

    return jsonify({
        "message": f"As a rewards member, you selected class {code}: {vc['name']}",
        "vehicle_class": vc,
    })
