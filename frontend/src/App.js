import React from "react";
import { Routes, Route, Link, useLocation } from "react-router-dom";
import Home from "./pages/Home";
import ClassDetail from "./pages/ClassDetail";
import Rewards from "./pages/Rewards";
import Luxury from "./pages/Luxury";
import ManagerSpecial from "./pages/ManagerSpecial";
import Passenger from "./pages/Passenger";
import About from "./pages/About";
import "./App.css";

function NavLink({ to, children }) {
  const location = useLocation();
  const isActive = location.pathname === to;
  return (
    <Link to={to} className={`nav-link ${isActive ? "active" : ""}`}>
      {children}
    </Link>
  );
}

export default function App() {
  return (
    <div className="app">
      <header className="header">
        <div className="header-inner">
          <Link to="/" className="logo">
            <h1>Rental Car Selector</h1>
            <p className="tagline">Here to get you the best rental car!</p>
          </Link>
          <nav className="nav">
            <NavLink to="/">Browse Cars</NavLink>
            <NavLink to="/rewards">Rewards</NavLink>
            <NavLink to="/luxury">Luxury</NavLink>
            <NavLink to="/manager-special">Manager's Special</NavLink>
            <NavLink to="/passenger">By Passengers</NavLink>
            <NavLink to="/about">About</NavLink>
          </nav>
        </div>
      </header>

      <main className="main">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/class/:code" element={<ClassDetail />} />
          <Route path="/rewards" element={<Rewards />} />
          <Route path="/luxury" element={<Luxury />} />
          <Route path="/manager-special" element={<ManagerSpecial />} />
          <Route path="/passenger" element={<Passenger />} />
          <Route path="/about" element={<About />} />
        </Routes>
      </main>

      <footer className="footer">
        <p>Rental Car Selector &mdash; Safe travels!</p>
      </footer>
    </div>
  );
}
