from flask import Blueprint, jsonify, request
from db import query_db

passenger_bp = Blueprint("passenger", __name__)


@passenger_bp.route("/", methods=["POST"])
def passenger_recommend():
    data = request.get_json()
    count = data.get("passenger_count", 1)

    try:
        count = int(count)
    except (ValueError, TypeError):
        return jsonify({"error": "Please enter a valid number"}), 400

    if count <= 0 or count > 12:
        return jsonify({"error": "Passenger count must be between 1 and 12"}), 400

    if count < 5:
        message = "Great, you should consider all classes!"
        classes = query_db(
            "SELECT id, code, name, category, max_passengers FROM vehicle_classes ORDER BY id"
        )
    elif count < 8:
        message = "Great, you should consider classes L4, P6, and R."
        classes = query_db(
            "SELECT id, code, name, category, max_passengers FROM vehicle_classes WHERE code IN ('L4', 'P6', 'R') ORDER BY id"
        )
    else:
        message = "Unfortunately, your only choice is class M (Fullsize Van)."
        classes = query_db(
            "SELECT id, code, name, category, max_passengers FROM vehicle_classes WHERE code = 'M'"
        )

    return jsonify({
        "message": message,
        "passenger_count": count,
        "recommended_classes": classes,
    })
