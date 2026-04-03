import React from "react";
import { Link } from "react-router-dom";

export default function About() {
  return (
    <div>
      <h2 className="page-title">About Rental Car Selector</h2>
      <p className="page-subtitle">Here to get you the best rental car!</p>

      <div className="info-box">
        <p>
          This app was made for people who are very curious about the car they
          selected from the website. We wanted to give you a clearer picture of
          what rental car you will get when you select your class. Despite having
          one class, some cars are much higher rated than others.
        </p>
      </div>

      <div className="info-box">
        <p>
          Our hope is that you get a sweet rental car, or you can also negotiate
          yourself for a certain model if they do have one in stock. Keep in
          mind, you may want to search the entire rental car field out!
        </p>
      </div>

      <h3 style={{ color: "#e2e8f0", marginBottom: "1rem" }}>Our Services</h3>
      <div className="card-grid" style={{ marginBottom: "2rem" }}>
        <Link to="/rewards" className="card">
          <h3 style={{ color: "#38bdf8" }}>Rewards Program</h3>
          <p style={{ color: "#94a3b8", marginTop: "0.5rem" }}>
            Rewards members can pick from any car class in our fleet.
          </p>
        </Link>
        <Link to="/luxury" className="card">
          <h3 style={{ color: "#fcd34d" }}>Luxury Selection</h3>
          <p style={{ color: "#94a3b8", marginTop: "0.5rem" }}>
            Browse our exclusive luxury vehicle classes: P4, G4, O4, H4, K4,
            and P6.
          </p>
        </Link>
        <Link to="/manager-special" className="card">
          <h3 style={{ color: "#818cf8" }}>Manager's Special</h3>
          <p style={{ color: "#94a3b8", marginTop: "0.5rem" }}>
            Feeling adventurous? Get a randomly assigned car class!
          </p>
        </Link>
        <Link to="/passenger" className="card">
          <h3 style={{ color: "#6ee7b7" }}>Passenger-Based Selection</h3>
          <p style={{ color: "#94a3b8", marginTop: "0.5rem" }}>
            Find the right vehicle based on your group size (up to 12).
          </p>
        </Link>
      </div>

      <div className="info-box" style={{ borderColor: "#334155" }}>
        <h3 style={{ color: "#94a3b8", marginBottom: "0.5rem" }}>
          New / Upcoming Features
        </h3>
        <p style={{ color: "#64748b" }}>
          We will be updating this page when new features roll out on our app.
          Stay tuned!
        </p>
      </div>
    </div>
  );
}
