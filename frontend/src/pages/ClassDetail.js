import React, { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";
import { getClassDetail } from "../api";

export default function ClassDetail() {
  const { code } = useParams();
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    setLoading(true);
    setError(null);
    getClassDetail(code)
      .then(setData)
      .catch((err) => setError(err.message))
      .finally(() => setLoading(false));
  }, [code]);

  if (loading) return <div className="loading">Loading...</div>;
  if (error) return <div className="error-msg">{error}</div>;
  if (!data) return null;

  return (
    <div>
      <Link to="/" className="btn btn-secondary" style={{ marginBottom: "1.5rem", display: "inline-block" }}>
        &larr; Back to All Classes
      </Link>

      <div style={{ display: "flex", alignItems: "center", gap: "1rem", marginBottom: "0.5rem" }}>
        <h2 className="page-title">{data.name}</h2>
        <span className={`badge badge-${data.category}`}>{data.category}</span>
        {data.is_luxury ? <span className="star-badge">LUXURY</span> : null}
      </div>
      <p style={{ color: "#64748b", marginBottom: "2rem" }}>
        Class Code: <strong style={{ color: "#38bdf8" }}>{data.code}</strong> &middot; Up to {data.max_passengers} passengers
      </p>

      <div className="info-box">
        <p>{data.description}</p>
      </div>

      <div className="recommendation">
        <h3>Our Recommendation</h3>
        <p style={{ color: "#cbd5e1", lineHeight: 1.7 }}>{data.recommendation}</p>
      </div>

      {data.models && data.models.length > 0 && (
        <>
          <h3 style={{ marginTop: "2rem", marginBottom: "1rem", color: "#e2e8f0" }}>
            Available Models ({data.models.length})
          </h3>
          <div className="model-list">
            {data.models.map((m) => (
              <div key={m.id} className={`model-card ${m.is_recommended ? "recommended" : ""}`}>
                <div className="make">{m.make}</div>
                <div className="model-name">
                  {m.model} {m.trim_level || ""}
                </div>
                {m.is_recommended ? <span className="star-badge">RECOMMENDED</span> : null}
              </div>
            ))}
          </div>
        </>
      )}
    </div>
  );
}
