
-- Crear base de user, datos y tablas
SOURCE /home/xkleiber/capibara/db/database/tables.sql;

-- Crear vistas
SOURCE /home/xkleiber/capibara/db/database/views.sql;

-- Deshabilitar verificación de claves foráneas para inserción de datos
SET FOREIGN_KEY_CHECKS = 0;

-- Insertar datos en orden de dependencias
-- Tablas sin dependencias
SOURCE /home/xkleiber/capibara/db/data/semesters.sql;
SOURCE /home/xkleiber/capibara/db/data/roles.sql;
SOURCE /home/xkleiber/capibara/db/data/students.sql;
SOURCE /home/xkleiber/capibara/db/data/questions.sql;

-- Tablas con dependencias simples
SOURCE /home/xkleiber/capibara/db/data/contests.sql;
SOURCE /home/xkleiber/capibara/db/data/groups.sql;
SOURCE /home/xkleiber/capibara/db/data/contestants.sql;
SOURCE /home/xkleiber/capibara/db/data/members.sql;

-- Tablas con múltiples dependencias
SOURCE /home/xkleiber/capibara/db/data/teams.sql;
SOURCE /home/xkleiber/capibara/db/data/group_members.sql;
SOURCE /home/xkleiber/capibara/db/data/contest_teams.sql;
SOURCE /home/xkleiber/capibara/db/data/contest_questions.sql;
SOURCE /home/xkleiber/capibara/db/data/scientific_articles.sql;

-- Rehabilitar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

