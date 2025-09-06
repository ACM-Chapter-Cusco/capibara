USE capsule;

INSERT INTO roles (id, name) VALUES
(1, 'Student'),
(2, 'Member'),
(3, 'Coordinator'),
(4, 'Leader'),
(5, 'Admin');

ALTER TABLE roles AUTO_INCREMENT = 6;
