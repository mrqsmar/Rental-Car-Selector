import React, { useState } from "react";
import { Link } from "react-router-dom";
import { getPassengerRecommendation } from "../api";

export default function Passenger() {
  const [count, setCount] = useState("");
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!count) return;
    setLoading(true);
    setError(null);
    setResult(null);
    getPassengerRecommendation(parseInt(count, 10))
      .then(setResult)
      .catch((err) => setError(err.message))
      .finally(() => setLoading(false));
  };

  return (
    <div>
      <h2 className="page-title">Find Cars by Passenger Count</h2>
      <p className="page-subtitle">
        Tell us how many people are coming, and we'll recommend the right vehicle classes.
      </p>

      <div className="info-box">
        <p>
          How many people are coming with you on your trip including yourself?
          (Max 12)
        </p>
        <ul style={{ marginTop: "1rem", paddingLeft: "1.5rem", color: "#94a3b8", lineHeight: 2 }}>
          <li><strong>1-4 passengers:</strong> All vehicle classes available</li>
          <li><strong>5-7 passengers:</strong> 7-Passenger SUV (L4), Fullsize Luxury SUV (P6), or Minivan (R)</li>
          <li><strong>8-12 passengers:</strong> Fullsize Van (M) only</li>
        </ul>
      </div>

      <form onSubmit={handleSubmit} style={{ display: "flex", gap: "1rem", alignItems: "center", marginBottom: "2rem" }}>
        <input
          type="number"
          min="1"
          max="12"
          value={count}
          onChange={(e) => setCount(e.target.value)}
          placeholder="Number of passengers"
          style={{ width: "220px" }}
        />
        <button className="btn btn-primary" type="submit" disabled={loading}>
          {loading ? "Finding..." : "Find Cars"}
        </button>
      </form>

      {error && <div className="error-msg">{error}</div>}

      {result && (
        <div>
          <div className="recommendation">
            <h3>{result.message}</h3>
            <p style={{ color: "#94a3b8", marginTop: "0.5rem" }}>
              For {result.passenger_count} passenger{result.passenger_count > 1 ? "s" : ""}
            </p>
          </div>

          <h3 style={{ marginTop: "1.5rem", marginBottom: "1rem", color: "#e2e8f0" }}>
            Recommended Classes ({result.recommended_classes.length})
          </h3>
          <div className="card-grid">
            {result.recommended_classes.map((c) => (
              <Link key={c.code} to={`/class/${c.code}`} className="card">
                <span className={`badge badge-${c.category}`}>{c.category}</span>
                <h3 style={{ marginTop: "0.75rem" }}>{c.name}</h3>
                <p style={{ color: "#64748b", fontSize: "0.9rem" }}>
                  Code: <strong style={{ color: "#38bdf8" }}>{c.code}</strong>
                </p>
                <p style={{ color: "#94a3b8", fontSize: "0.85rem", marginTop: "0.25rem" }}>
                  Up to {c.max_passengers} passengers
                </p>
              </Link>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
