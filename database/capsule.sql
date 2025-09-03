-- Drop user if exists
DROP USER 'capsule'@'localhost';

-- Create user
CREATE USER 'capsule'@'localhost' IDENTIFIED BY 'capsule';

-- Add privileges
GRANT ALL PRIVILEGES ON capsule.* TO 'capsule'@'localhost';
FLUSH PRIVILEGES;

-- Drop database if exists
DROP DATABASE IF EXISTS capsule;

-- Create database
CREATE DATABASE capsule;

-- Select the new database
USE capsule;

-- Drop table if exists
DROP TABLE IF EXISTS person;

-- Create table person
CREATE TABLE IF NOT EXISTS person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    email VARCHAR(255) UNIQUE,
    city VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO person (id, name, age, email, city, is_active, created_at) VALUES
(1, 'Alice', 28, 'alice@example.com', 'New York', TRUE, '2025-09-03 10:30:00'),
(2, 'Bob', 35, 'bob@example.com', 'San Francisco', FALSE, '2025-08-20 14:45:00'),
(3, 'Charlie', 22, 'charlie@example.com', 'London', TRUE, '2025-07-15 09:00:00'),
(4, 'Diana', 40, 'diana@example.com', 'Paris', TRUE, '2025-09-01 16:20:00'),
(5, 'Ethan', 30, 'ethan@example.com', 'Tokyo', FALSE, '2025-06-10 12:15:00');
