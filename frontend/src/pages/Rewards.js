import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { getRewardsInfo, getAllClasses, rewardsSelect } from "../api";

export default function Rewards() {
  const [info, setInfo] = useState(null);
  const [classes, setClasses] = useState([]);
  const [selectedCode, setSelectedCode] = useState("");
  const [result, setResult] = useState(null);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([getRewardsInfo(), getAllClasses()])
      .then(([infoData, classData]) => {
        setInfo(infoData);
        setClasses(classData);
      })
      .catch(() => {})
      .finally(() => setLoading(false));
  }, []);

  const handleSelect = () => {
    if (!selectedCode) return;
    setError(null);
    rewardsSelect(selectedCode)
      .then(setResult)
      .catch((err) => setError(err.message));
  };

  if (loading) return <div className="loading">Loading...</div>;

  return (
    <div>
      <h2 className="page-title">Rewards Program</h2>
      {info && <p className="page-subtitle">{info.message}</p>}

      <div className="info-box">
        <p>{info?.description}</p>
      </div>

      <div style={{ display: "flex", gap: "1rem", alignItems: "center", marginBottom: "2rem", flexWrap: "wrap" }}>
        <select value={selectedCode} onChange={(e) => setSelectedCode(e.target.value)}>
          <option value="">-- Select a class --</option>
          {classes.map((c) => (
            <option key={c.code} value={c.code}>
              {c.code} - {c.name}
            </option>
          ))}
        </select>
        <button className="btn btn-primary" onClick={handleSelect}>
          Select Class
        </button>
      </div>

      {error && <div className="error-msg">{error}</div>}

      {result && (
        <div>
          <div className="recommendation">
            <h3>{result.message}</h3>
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
