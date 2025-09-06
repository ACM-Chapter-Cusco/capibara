USE capsule;

INSERT INTO contests (id, edition, description, contest_date, year, semester_id) VALUES
(1, 'Edicion X', 'Cuscontest - Edicion X', '2014-08-19', 2014, 10),
(2, 'Edicion XII', 'Cuscontest - Edicion XII', '2005-11-13', 2005, 10),
(3, 'Edicion XXI', 'Cuscontest - Edicion XXI', '2006-01-23', 2006, 5),
(4, 'Edicion XXVI', 'Cuscontest - Edicion XXVI', '2017-09-25', 2017, 1),
(5, 'Edicion XXVIII', 'Cuscontest - Edicion XXVIII', '2020-10-13', 2020, 7),
(6, 'Edicion XXII', 'Cuscontest - Edicion XXII', '2007-05-08', 2007, 1),
(7, 'Edicion XIX', 'Cuscontest - Edicion XIX', '2004-05-12', 2004, 7),
(8, 'Edicion XXX', 'Cuscontest - Edicion XXX', '2016-04-14', 2016, 3),
(9, 'Edicion XXIII', 'Cuscontest - Edicion XXIII', '2010-03-24', 2010, 3),
(10, 'Edicion II', 'Cuscontest - Edicion II', '2000-01-07', 2000, 9);

ALTER TABLE contests AUTO_INCREMENT = 11;
