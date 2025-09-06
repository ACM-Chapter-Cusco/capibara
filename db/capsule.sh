#!/bin/bash
# Genera script de configuración con variable HOME expandida

cat > $HOME/capibara/db/capsule.sql << EOF

-- Crear base de user, datos y tablas
SOURCE $HOME/capibara/db/database/tables.sql;

-- Crear vistas
SOURCE $HOME/capibara/db/database/views.sql;

-- Deshabilitar verificación de claves foráneas para inserción de datos
SET FOREIGN_KEY_CHECKS = 0;

-- Insertar datos en orden de dependencias
-- Tablas sin dependencias
SOURCE $HOME/capibara/db/data/semesters.sql;
SOURCE $HOME/capibara/db/data/roles.sql;
SOURCE $HOME/capibara/db/data/students.sql;
SOURCE $HOME/capibara/db/data/questions.sql;

-- Tablas con dependencias simples
SOURCE $HOME/capibara/db/data/contests.sql;
SOURCE $HOME/capibara/db/data/groups.sql;
SOURCE $HOME/capibara/db/data/contestants.sql;
SOURCE $HOME/capibara/db/data/members.sql;

-- Tablas con múltiples dependencias
SOURCE $HOME/capibara/db/data/teams.sql;
SOURCE $HOME/capibara/db/data/group_members.sql;
SOURCE $HOME/capibara/db/data/contest_teams.sql;
SOURCE $HOME/capibara/db/data/contest_questions.sql;
SOURCE $HOME/capibara/db/data/scientific_articles.sql;

-- Rehabilitar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

EOF

echo "Database created successfully!"

# Ejecutar la configuración con root
mysql -u root < $HOME/capibara/db/capsule.sql
