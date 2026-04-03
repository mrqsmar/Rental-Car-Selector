from flask import Blueprint, jsonify
from db import query_db

vehicles_bp = Blueprint("vehicles", __name__)


@vehicles_bp.route("/", methods=["GET"])
def get_all_classes():
    classes = query_db(
        "SELECT id, code, name, category, is_luxury, max_passengers FROM vehicle_classes ORDER BY id"
    )
    return jsonify(classes)


@vehicles_bp.route("/<string:code>", methods=["GET"])
def get_class_detail(code):
    vc = query_db(
        "SELECT * FROM vehicle_classes WHERE code = %s",
        (code.upper(),),
        fetchone=True,
    )
    if not vc:
        return jsonify({"error": "Vehicle class not found"}), 404

    models = query_db(
        "SELECT id, make, model, trim_level, is_recommended FROM vehicle_models WHERE class_id = %s ORDER BY is_recommended DESC, make",
        (vc["id"],),
    )
    vc["models"] = models
    return jsonify(vc)
