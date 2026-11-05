-- database/schema.sql

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    full_name TEXT NOT NULL,
    canvas_ical_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE canvas_events (
    event_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    canvas_uid TEXT UNIQUE NOT NULL, 
    course_name TEXT, 
    title TEXT NOT NULL, 
    description TEXT,
    due_date TIMESTAMP NOT NULL,
    event_type TEXT CHECK(event_type IN ('Assignment', 'Event', 'Quiz')),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE study_sessions (
    session_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    canvas_event_id INTEGER, 
    planned_start TIMESTAMP NOT NULL,
    planned_end TIMESTAMP NOT NULL,
    status TEXT CHECK(status IN ('Planned', 'Completed', 'Missed')) DEFAULT 'Planned',
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (canvas_event_id) REFERENCES canvas_events(event_id) ON DELETE CASCADE
);
