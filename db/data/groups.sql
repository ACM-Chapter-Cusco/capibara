USE capsule;

INSERT INTO groups (id, name, description) VALUES
(1, 'Sunset Serpents', 'Circulo de estudios especializados en cloud computing'),
(2, 'Midnight Panthers', 'Circulo de estudios especializados en cloud computing'),
(3, 'Golden Eagles', 'Circulo de estudios especializados en game development'),
(4, 'Tiger Sharks', 'Circulo de estudios especializados en game development'),
(5, 'Thunderbolts', 'Circulo de estudios especializados en machine learning');

ALTER TABLE groups AUTO_INCREMENT = 6;
