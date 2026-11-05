# Database Setup

This project uses SQLite for local development to keep setup simple. 

## How to initialize the database locally

1. Open your terminal and navigate to this `database/` folder.
2. Run the following command to create the database file and apply the schema:
   ```bash
   sqlite3 planner.db < schema.sql
