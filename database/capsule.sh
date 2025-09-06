#!/bin/bash
# Genera script de configuración con variable HOME expandida

cat > $HOME/capibara/database/capsule.sql << EOF

-- Crear base de datos y tablas
SOURCE $HOME/capibara/database/tables.sql;

-- Crear vistas
SOURCE $HOME/capibara/database/views.sql;

-- Deshabilitar verificación de claves foráneas para inserción de datos
SET FOREIGN_KEY_CHECKS = 0;

-- Insertar datos en orden de dependencias
-- Tablas sin dependencias
SOURCE $HOME/capibara/database/data/semestre.sql;
SOURCE $HOME/capibara/database/data/roles.sql;
SOURCE $HOME/capibara/database/data/alumnos.sql;

-- Tablas con dependencias simples
SOURCE $HOME/capibara/database/data/contests.sql;
SOURCE $HOME/capibara/database/data/teams.sql;
SOURCE $HOME/capibara/database/data/alumnos_competidores.sql;
SOURCE $HOME/capibara/database/data/miembros.sql;

-- Tablas con múltiples dependencias
SOURCE $HOME/capibara/database/data/equipos.sql;
SOURCE $HOME/capibara/database/data/miembros_team.sql;
SOURCE $HOME/capibara/database/data/participantes_contest.sql;
SOURCE $HOME/capibara/database/data/preguntas.sql;
SOURCE $HOME/capibara/database/data/scientific_articles.sql;

-- Rehabilitar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

-- Verificar configuración
SELECT 'Configuración de base de datos completada!' as estado;
EOF

echo "Generado capsule.sql con rutas expandidas"

# Ejecutar la configuración
mysql -u capsule -p < $HOME/capibara/database/capsule.sql
