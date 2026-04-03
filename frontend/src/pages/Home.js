import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { getAllClasses } from "../api";

const CATEGORY_LABELS = {
  economy: "Economy",
  standard: "Standard",
  premium: "Premium",
  luxury: "Luxury",
  suv: "SUV",
  truck: "Truck",
  van: "Van",
  specialty: "Specialty",
};

export default function Home() {
  const [classes, setClasses] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState("all");

  useEffect(() => {
    getAllClasses()
      .then(setClasses)
      .catch(() => setClasses([]))
      .finally(() => setLoading(false));
  }, []);

  const categories = ["all", ...new Set(classes.map((c) => c.category))];
  const filtered =
    filter === "all" ? classes : classes.filter((c) => c.category === filter);

  if (loading) return <div className="loading">Loading vehicle classes...</div>;

  return (
    <div>
      <h2 className="page-title">Browse Vehicle Classes</h2>
      <p className="page-subtitle">
        Select a vehicle class to see available models and our recommendations.
      </p>

      <div style={{ display: "flex", gap: "0.5rem", marginBottom: "1.5rem", flexWrap: "wrap" }}>
        {categories.map((cat) => (
          <button
            key={cat}
            className={`btn ${filter === cat ? "btn-primary" : "btn-secondary"}`}
            onClick={() => setFilter(cat)}
            style={{ padding: "0.5rem 1rem", fontSize: "0.85rem" }}
          >
            {cat === "all" ? "All" : CATEGORY_LABELS[cat] || cat}
          </button>
        ))}
      </div>

      <div className="card-grid">
        {filtered.map((vc) => (
          <Link key={vc.code} to={`/class/${vc.code}`} className="card">
            <span className={`badge badge-${vc.category}`}>
              {CATEGORY_LABELS[vc.category] || vc.category}
            </span>
            <h3 style={{ marginTop: "0.75rem", fontSize: "1.25rem" }}>{vc.name}</h3>
            <p style={{ color: "#64748b", fontSize: "0.9rem", marginTop: "0.25rem" }}>
              Code: <strong style={{ color: "#38bdf8" }}>{vc.code}</strong>
            </p>
            <p style={{ color: "#94a3b8", fontSize: "0.85rem", marginTop: "0.5rem" }}>
              Up to {vc.max_passengers} passengers
            </p>
            {vc.is_luxury ? (
              <span className="star-badge" style={{ marginTop: "0.5rem" }}>LUXURY</span>
            ) : null}
          </Link>
        ))}
      </div>
    </div>
  );
}
