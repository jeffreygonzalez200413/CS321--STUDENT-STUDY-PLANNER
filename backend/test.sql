-- database/seed.sql

-- Insert a test user
INSERT INTO users (email, password_hash, full_name, canvas_ical_url) 
VALUES ('student@gmu.edu', 'hashed_password_123', 'Test Student', 'https://canvas.gmu.edu/feeds/calendars/test.ics');

-- Insert fake Canvas deadlines (matching typical CS courses)
INSERT INTO canvas_events (user_id, canvas_uid, course_name, title, description, due_date, event_type) 
VALUES 
(1, 'uid_1001', 'CS 321', 'Project Deliverable 03: First Sprint', 'Submit the first sprint code.', '2026-11-05 23:59:00', 'Assignment'),
(1, 'uid_1002', 'CS 483', 'Project Milestone #1', 'Algorithm design document.', '2026-11-08 23:59:00', 'Assignment');

-- Insert a planned study session for the CS 321 deliverable
INSERT INTO study_sessions (user_id, canvas_event_id, planned_start, planned_end, status, notes)
VALUES 
(1, 1, '2026-11-03 14:00:00', '2026-11-03 16:00:00', 'Completed', 'Finished the database schema.'),
(1, 2, '2026-11-06 18:00:00', '2026-11-06 20:00:00', 'Planned', 'Review DP algorithms before writing the doc.');
