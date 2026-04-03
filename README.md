# Rental Car Selector

A web application to help users find the best rental car for their needs. Built with **Flask** (backend), **React.js** (frontend), and **MySQL** (database).

## Features

The app provides 4 microservices, now available as web-based experiences:

1. **Browse Cars** - View all 26 vehicle classes with detailed descriptions, models, and expert recommendations
2. **Rewards Program** - Rewards members can select from any vehicle class in the fleet
3. **Luxury Selection** - Browse and select from luxury vehicle classes (P4, G4, O4, H4, K4, P6)
4. **Manager's Special** - Get a randomly assigned vehicle class
5. **Passenger-Based Selection** - Find the right vehicle based on group size (1-12 passengers)

## Prerequisites

- Python 3.9+
- Node.js 18+
- MySQL 8.0+

## Setup

### 1. Database

```bash
# Log into MySQL and run the schema/seed script
mysql -u root -p < backend/schema.sql
```

### 2. Backend

```bash
cd backend

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Edit .env with your MySQL credentials

# Run the server
python app.py
```

The API will be available at `http://localhost:5000`.

### 3. Frontend

```bash
cd frontend

# Install dependencies
npm install

# Start development server
npm start
```

The app will open at `http://localhost:3000`.

## API Endpoints

| Endpoint | Method | Description |
|---|---|---|
| `GET /api/vehicles/` | GET | List all vehicle classes |
| `GET /api/vehicles/<code>` | GET | Get vehicle class detail with models |
| `GET /api/rewards/` | GET | Rewards program info |
| `POST /api/rewards/select` | POST | Select a class as rewards member |
| `GET /api/luxury/` | GET | List luxury classes |
| `POST /api/luxury/select` | POST | Select a luxury class |
| `POST /api/manager-special/` | POST | Get a random vehicle class |
| `POST /api/passenger/` | POST | Get recommendations by passenger count |

## Project Structure

```
Rental-Car-Selector/
├── backend/
│   ├── app.py              # Flask application entry point
│   ├── config.py           # Configuration from environment
│   ├── db.py               # MySQL database helper
│   ├── schema.sql          # Database schema and seed data
│   ├── requirements.txt    # Python dependencies
│   └── routes/
│       ├── vehicles.py     # Browse all vehicle classes
│       ├── rewards.py      # Rewards program microservice
│       ├── luxury.py       # Luxury selection microservice
│       ├── manager_special.py  # Random car microservice
│       └── passenger.py    # Passenger count microservice
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── App.js          # Main app with routing
│   │   ├── api.js          # API client functions
│   │   └── pages/
│   │       ├── Home.js         # Vehicle class browser
│   │       ├── ClassDetail.js  # Individual class details
│   │       ├── Rewards.js      # Rewards program page
│   │       ├── Luxury.js       # Luxury selection page
│   │       ├── ManagerSpecial.js   # Random car page
│   │       ├── Passenger.js    # Passenger-based selection
│   │       └── About.js       # About page
│   └── package.json
└── README.md
```
