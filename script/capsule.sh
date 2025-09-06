#!/bin/bash
# Genera script de configuración con variable HOME expandida

cat > $HOME/capibara/script/capsule.sql << EOF

-- Crear base de user, datos y tablas
SOURCE $HOME/capibara/script/database/tables.sql;

-- Crear vistas
SOURCE $HOME/capibara/script/database/views.sql;

-- Deshabilitar verificación de claves foráneas para inserción de datos
SET FOREIGN_KEY_CHECKS = 0;

-- Insertar datos en orden de dependencias
-- Tablas sin dependencias
SOURCE $HOME/capibara/script/data/semesters.sql;
SOURCE $HOME/capibara/script/data/roles.sql;
SOURCE $HOME/capibara/script/data/students.sql;
SOURCE $HOME/capibara/script/data/questions.sql;

-- Tablas con dependencias simples
SOURCE $HOME/capibara/script/data/contests.sql;
SOURCE $HOME/capibara/script/data/circles.sql;
SOURCE $HOME/capibara/script/data/contestants.sql;
SOURCE $HOME/capibara/script/data/members.sql;

-- Tablas con múltiples dependencias
SOURCE $HOME/capibara/script/data/teams.sql;
SOURCE $HOME/capibara/script/data/circle_members.sql;
SOURCE $HOME/capibara/script/data/contest_teams.sql;
SOURCE $HOME/capibara/script/data/contest_questions.sql;
SOURCE $HOME/capibara/script/data/scientific_articles.sql;

-- Rehabilitar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

EOF

echo "Database created successfully!"

# Ejecutar la configuración con root
mysql -u root < $HOME/capibara/script/capsule.sql
