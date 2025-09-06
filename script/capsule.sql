
-- Crear base de user, datos y tablas
SOURCE /home/xkleiber/capibara/script/database/tables.sql;

-- Crear vistas
SOURCE /home/xkleiber/capibara/script/database/views.sql;

-- Deshabilitar verificación de claves foráneas para inserción de datos
SET FOREIGN_KEY_CHECKS = 0;

-- Insertar datos en orden de dependencias
-- Tablas sin dependencias
SOURCE /home/xkleiber/capibara/script/data/semesters.sql;
SOURCE /home/xkleiber/capibara/script/data/roles.sql;
SOURCE /home/xkleiber/capibara/script/data/students.sql;
SOURCE /home/xkleiber/capibara/script/data/questions.sql;

-- Tablas con dependencias simples
SOURCE /home/xkleiber/capibara/script/data/contests.sql;
SOURCE /home/xkleiber/capibara/script/data/circles.sql;
SOURCE /home/xkleiber/capibara/script/data/contestants.sql;
SOURCE /home/xkleiber/capibara/script/data/members.sql;

-- Tablas con múltiples dependencias
SOURCE /home/xkleiber/capibara/script/data/teams.sql;
SOURCE /home/xkleiber/capibara/script/data/circle_members.sql;
SOURCE /home/xkleiber/capibara/script/data/contest_teams.sql;
SOURCE /home/xkleiber/capibara/script/data/contest_questions.sql;
SOURCE /home/xkleiber/capibara/script/data/scientific_articles.sql;

-- Rehabilitar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

