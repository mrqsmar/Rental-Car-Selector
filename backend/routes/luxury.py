from flask import Blueprint, jsonify, request
from db import query_db

luxury_bp = Blueprint("luxury", __name__)

LUXURY_CODES = ["P4", "G4", "O4", "H4", "K4", "P6"]


@luxury_bp.route("/", methods=["GET"])
def luxury_classes():
    placeholders = ",".join(["%s"] * len(LUXURY_CODES))
    classes = query_db(
        f"SELECT id, code, name, category, max_passengers FROM vehicle_classes WHERE code IN ({placeholders}) ORDER BY id",
        tuple(LUXURY_CODES),
    )
    return jsonify({
        "message": "Since you want a luxury car, you can choose from the following classes: P4, G4, O4, H4, K4, and P6.",
        "classes": classes,
    })


@luxury_bp.route("/select", methods=["POST"])
def luxury_select():
    data = request.get_json()
    code = data.get("code", "").upper()

    if code not in LUXURY_CODES:
        return jsonify({
            "error": f"Invalid luxury class. Must be one of: {', '.join(LUXURY_CODES)}"
        }), 400

    vc = query_db(
        "SELECT * FROM vehicle_classes WHERE code = %s",
        (code,),
        fetchone=True,
    )
    models = query_db(
        "SELECT id, make, model, trim_level, is_recommended FROM vehicle_models WHERE class_id = %s ORDER BY is_recommended DESC, make",
        (vc["id"],),
    )
    vc["models"] = models

    return jsonify({
        "message": f"You selected luxury class {code}: {vc['name']}",
        "vehicle_class": vc,
    })
