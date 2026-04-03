import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { getLuxuryClasses, luxurySelect } from "../api";

export default function Luxury() {
  const [data, setData] = useState(null);
  const [selectedCode, setSelectedCode] = useState("");
  const [result, setResult] = useState(null);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getLuxuryClasses()
      .then(setData)
      .catch(() => {})
      .finally(() => setLoading(false));
  }, []);

  const handleSelect = () => {
    if (!selectedCode) return;
    setError(null);
    luxurySelect(selectedCode)
      .then(setResult)
      .catch((err) => setError(err.message));
  };

  if (loading) return <div className="loading">Loading...</div>;

  return (
    <div>
      <h2 className="page-title">Luxury Vehicles</h2>
      {data && <p className="page-subtitle">{data.message}</p>}

      <div className="card-grid" style={{ marginBottom: "2rem" }}>
        {data?.classes.map((c) => (
          <div
            key={c.code}
            className={`card ${selectedCode === c.code ? "" : ""}`}
            style={{
              cursor: "pointer",
              borderColor: selectedCode === c.code ? "#38bdf8" : undefined,
            }}
            onClick={() => setSelectedCode(c.code)}
          >
            <span className="badge badge-luxury">Luxury</span>
            <h3 style={{ marginTop: "0.75rem" }}>{c.name}</h3>
            <p style={{ color: "#64748b", fontSize: "0.9rem" }}>Code: {c.code}</p>
          </div>
        ))}
      </div>

      {selectedCode && (
        <button className="btn btn-primary" onClick={handleSelect} style={{ marginBottom: "1.5rem" }}>
          Get Details for {selectedCode}
        </button>
      )}

      {error && <div className="error-msg">{error}</div>}

      {result && (
        <div>
          <div className="recommendation">
            <h3>{result.message}</h3>
            <p style={{ color: "#cbd5e1", marginTop: "0.5rem" }}>
              {result.vehicle_class.description}
            </p>
          </div>
          <div className="recommendation" style={{ marginTop: "1rem" }}>
            <h3>Our Recommendation</h3>
            <p style={{ color: "#cbd5e1" }}>{result.vehicle_class.recommendation}</p>
          </div>
          <div style={{ marginTop: "1rem" }}>
            <Link to={`/class/${result.vehicle_class.code}`} className="btn btn-primary">
              View Full Details
            </Link>
          </div>
          {result.vehicle_class.models && (
            <div className="model-list" style={{ marginTop: "1rem" }}>
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
