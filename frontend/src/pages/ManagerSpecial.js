import React, { useState } from "react";
import { Link } from "react-router-dom";
import { getManagerSpecial } from "../api";

export default function ManagerSpecial() {
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleSpin = () => {
    setLoading(true);
    setError(null);
    setResult(null);
    getManagerSpecial()
      .then(setResult)
      .catch((err) => setError(err.message))
      .finally(() => setLoading(false));
  };

  return (
    <div>
      <h2 className="page-title">Manager's Special</h2>
      <p className="page-subtitle">
        Feeling lucky? Let us pick a random car class for you!
      </p>

      <div className="info-box">
        <p>
          The Manager's Special randomly assigns you a vehicle class from our
          entire fleet. You might get an economy car, a luxury sedan, or even a
          full-size pickup truck. It's the luck of the draw!
        </p>
      </div>

      <button
        className="btn btn-primary"
        onClick={handleSpin}
        disabled={loading}
        style={{ fontSize: "1.1rem", padding: "1rem 2.5rem", marginBottom: "2rem" }}
      >
        {loading ? "Picking your car..." : "Get My Manager's Special!"}
      </button>

      {error && <div className="error-msg">{error}</div>}

      {result && (
        <div>
          <div className="recommendation">
            <h3>{result.message}</h3>
            <p style={{ marginTop: "0.5rem", fontSize: "1.2rem", color: "#e2e8f0" }}>
              You got: <strong style={{ color: "#38bdf8" }}>
                {result.vehicle_class.code} - {result.vehicle_class.name}
              </strong>
            </p>
          </div>

          <div className="info-box" style={{ marginTop: "1rem" }}>
            <p>{result.vehicle_class.description}</p>
          </div>

          <div className="recommendation" style={{ marginTop: "0" }}>
            <h3>Our Recommendation</h3>
            <p style={{ color: "#cbd5e1" }}>{result.vehicle_class.recommendation}</p>
          </div>

          <div style={{ marginTop: "1rem", display: "flex", gap: "1rem", flexWrap: "wrap" }}>
            <Link to={`/class/${result.vehicle_class.code}`} className="btn btn-primary">
              View Full Details
            </Link>
            <button className="btn btn-secondary" onClick={handleSpin}>
              Try Again
            </button>
          </div>

          {result.vehicle_class.models && (
            <div className="model-list" style={{ marginTop: "1.5rem" }}>
              {result.vehicle_class.models.map((m) => (
                <div key={m.id} className={`model-card ${m.is_recommended ? "recommended" : ""}`}>
                  <div className="make">{m.make}</div>
                  <div className="model-name">{m.model} {m.trim_level || ""}</div>
                  {m.is_recommended ? <span className="star-badge">RECOMMENDED</span> : null}
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  );
}
