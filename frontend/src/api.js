const API_BASE = process.env.REACT_APP_API_URL || "/api";

async function fetchJSON(url, options = {}) {
  const res = await fetch(`${API_BASE}${url}`, {
    headers: { "Content-Type": "application/json" },
    ...options,
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: "Request failed" }));
    throw new Error(err.error || "Request failed");
  }
  return res.json();
}

export function getAllClasses() {
  return fetchJSON("/vehicles/");
}

export function getClassDetail(code) {
  return fetchJSON(`/vehicles/${code}`);
}

export function getRewardsInfo() {
  return fetchJSON("/rewards/");
}

export function rewardsSelect(code) {
  return fetchJSON("/rewards/select", {
    method: "POST",
    body: JSON.stringify({ code }),
  });
}

export function getLuxuryClasses() {
  return fetchJSON("/luxury/");
}

export function luxurySelect(code) {
  return fetchJSON("/luxury/select", {
    method: "POST",
    body: JSON.stringify({ code }),
  });
}

export function getManagerSpecial() {
  return fetchJSON("/manager-special/", { method: "POST" });
}

export function getPassengerRecommendation(passengerCount) {
  return fetchJSON("/passenger/", {
    method: "POST",
    body: JSON.stringify({ passenger_count: passengerCount }),
  });
}
