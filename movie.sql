-- Drop existing database if exists
DROP DATABASE IF EXISTS movie_booking;

-- Create movie_booking database
CREATE DATABASE movie_booking;
USE movie_booking;

-- Drop tables if they exist
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS seats;
DROP TABLE IF EXISTS shows;
DROP TABLE IF EXISTS theaters;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS admins;

-- Create Movies Table
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    duration INT NOT NULL, -- Duration in minutes
    description TEXT NOT NULL,
    release_date DATE NOT NULL
);

-- Insert sample movies
INSERT INTO movies (title, genre, duration, description, release_date) VALUES
('The Matrix', 'Sci-Fi', 136, 'A hacker discovers reality is a simulation.', '1999-03-31'),
('Inception', 'Action', 148, 'A thief enters dreams to steal secrets.', '2010-07-16'),
('Interstellar', 'Sci-Fi', 169, 'A team travels through a wormhole to find a new home for humanity.', '2014-11-07'),
('The Dark Knight', 'Action', 152, 'Batman battles the Joker.', '2008-07-18'),
('Titanic', 'Romance', 195, 'A romance on the ill-fated ship Titanic.', '1997-12-19'),
('Avatar', 'Fantasy', 162, 'Humans explore Pandora and encounter native beings.', '2009-12-18'),
('Avengers', 'Action', 143, 'Marvel superheroes unite to save the world.', '2012-05-04'),
('Joker', 'Drama', 122, 'The origin story of Batman’s villain.', '2019-10-04'),
('Frozen', 'Animation', 102, 'A girl with magical powers learns to accept herself.', '2013-11-27'),
('The Godfather', 'Crime', 175, 'The rise of a mafia family.', '1972-03-24');
INSERT INTO movies (title, genre, duration, description, release_date) VALUES
('Guardians of the Galaxy', 'Action', 121, 'A group of intergalactic criminals must pull together to stop a fanatical warrior.', '2014-08-01'),
('Spider-Man: No Way Home', 'Action', 148, 'Spider-Man seeks help from Doctor Strange when his identity is revealed to the world.', '2021-12-17'),
('The Hunger Games', 'Action', 142, 'In a dystopian future, a young girl volunteers to take her sister’s place in a deadly televised game.', '2012-03-23'),
('The Incredibles', 'Animation', 115, 'A family of undercover superheroes tries to live the quiet suburban life, but are forced into action to save the world.', '2004-11-05'),
('Deadpool', 'Action', 108, 'A former Special Forces operative turned mercenary is subjected to a rogue experiment that leaves him with accelerated healing powers.', '2016-02-12'),
('Pirates of the Caribbean: The Curse of the Black Pearl', 'Adventure', 143, 'Captain Jack Sparrow teams up with a blacksmith to retrieve a stolen treasure.', '2003-07-09'),
('The Prestige', 'Drama', 130, 'Two magicians engage in a bitter rivalry, using each other’s secrets to ruin their careers and lives.', '2006-10-20'),
('The Departed', 'Crime', 151, 'An undercover cop and a mole in the police try to identify each other while infiltrating an Irish gang in Boston.', '2006-10-06'),
('Shutter Island', 'Mystery', 138, 'A U.S. Marshal investigates the disappearance of a murderess who escaped from a mental institution.', '2010-02-19'),
('The Social Network', 'Drama', 120, 'The story of the founding of Facebook and the social and legal challenges faced by its creators.', '2010-10-01');


-- Create Users Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Insert sample users
INSERT INTO users (name, email, password) VALUES
('Alice', 'alice@example.com', 'pass123'),
('Bob', 'bob@example.com', 'pass456'),
('Charlie', 'charlie@example.com', 'pass789'),
('David', 'david@example.com', 'pass000'),
('Eva', 'eva@example.com', 'pass111'),
('Frank', 'frank@example.com', 'pass222'),
('Grace', 'grace@example.com', 'pass333'),
('Henry', 'henry@example.com', 'pass444'),
('Ivy', 'ivy@example.com', 'pass555'),
('Jack', 'jack@example.com', 'pass666');

-- Create Theaters Table
CREATE TABLE theaters (
    theater_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

-- Insert sample theaters
INSERT INTO theaters (name, location) VALUES
('Cineplex 1', 'City A'),
('Cineplex 2', 'City B');

-- Create Shows Table
CREATE TABLE shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    theater_id INT,
    show_time DATETIME,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);

-- Insert sample shows
INSERT INTO shows (movie_id, theater_id, show_time) VALUES
(1, 1, '2025-06-01 14:00:00'),
(2, 1, '2025-06-01 17:00:00'),
(3, 1, '2025-06-01 20:00:00'),
(4, 2, '2025-06-02 14:00:00'),
(5, 2, '2025-06-02 17:00:00'),
(6, 2, '2025-06-02 20:00:00'),
(7, 1, '2025-06-03 14:00:00'),
(8, 1, '2025-06-03 17:00:00'),
(9, 2, '2025-06-04 14:00:00'),
(10, 2, '2025-06-04 17:00:00');

-- Create Seats Table
CREATE TABLE seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT,
    seat_number VARCHAR(10),
    is_booked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

-- Insert sample seats (100 seats for each show)
-- Show 1 (A1 to A100)
INSERT INTO seats (show_id, seat_number)
SELECT 1, CONCAT('A', n) FROM (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
  UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
  UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
  UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
  UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25
  UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30
  UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35
  UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40
  UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45
  UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50
  UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55
  UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59 UNION ALL SELECT 60
  UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65
  UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69 UNION ALL SELECT 70
  UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75
  UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79 UNION ALL SELECT 80
  UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85
  UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89 UNION ALL SELECT 90
  UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95
  UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99 UNION ALL SELECT 100
) AS numbers;

-- Repeat for other shows (2-10) with appropriate seat prefixes (B1 to B100, C1 to C100, etc.)
-- Show 2 (B1 to B100)
INSERT INTO seats (show_id, seat_number)
SELECT 2, CONCAT('B', n) FROM (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
  UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
  -- Add up to 100 as before
) AS numbers;

-- Continue for other shows 3 to 10
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    show_id INT,
    seat_id INT,
    booking_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);