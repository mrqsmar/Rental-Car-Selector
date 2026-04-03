from flask import Flask
from flask_cors import CORS

from config import Config
from routes.vehicles import vehicles_bp
from routes.rewards import rewards_bp
from routes.luxury import luxury_bp
from routes.manager_special import manager_special_bp
from routes.passenger import passenger_bp


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    CORS(app)

    app.register_blueprint(vehicles_bp, url_prefix="/api/vehicles")
    app.register_blueprint(rewards_bp, url_prefix="/api/rewards")
    app.register_blueprint(luxury_bp, url_prefix="/api/luxury")
    app.register_blueprint(manager_special_bp, url_prefix="/api/manager-special")
    app.register_blueprint(passenger_bp, url_prefix="/api/passenger")

    @app.route("/api/health")
    def health():
        return {"status": "ok"}

    return app


if __name__ == "__main__":
    app = create_app()
    app.run(debug=True, port=5000)
