USE capsule;

INSERT INTO teams (id, name, category, position, contest_id) VALUES
(1, 'Emerald Falcons', 'Avanzado', 5, 2),
(2, 'Silver Hawks', 'Intermedio', 4, 6),
(3, 'Midnight Panthers', 'Basico', 7, 9),
(4, 'Golden Eagles', 'Avanzado', 4, 1),
(5, 'Sunset Serpents', 'Intermedio', 8, 6),
(6, 'Lightning Bolts', 'Basico', 9, 3),
(7, 'Tiger Sharks', 'Avanzado', 3, 7),
(8, 'Storm Riders', 'Avanzado', 1, 5),
(9, 'Thunder Wolves', 'Basico', 2, 1),
(10, 'Ice Wolves', 'Basico', 4, 10),
(11, 'Crystal Dragons', 'Avanzado', 5, 6),
(12, 'Fire Dragons', 'Avanzado', 7, 1);

ALTER TABLE teams AUTO_INCREMENT = 13;
