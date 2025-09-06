
USE capsule;

-- Views
CREATE OR REPLACE VIEW alumnos_activos AS SELECT * FROM alumnos WHERE activo = TRUE;
CREATE OR REPLACE VIEW alumnos_competidores_activos AS SELECT * FROM alumnos_competidores WHERE activo = TRUE;
CREATE OR REPLACE VIEW areas_especialidad_activas AS SELECT * FROM areas_especialidad WHERE activo = TRUE;
CREATE OR REPLACE VIEW alumnos_competidores_areas_activas AS SELECT * FROM alumnos_competidores_areas WHERE activo = TRUE;
CREATE OR REPLACE VIEW semestre_activos AS SELECT * FROM semestre WHERE activo = TRUE;
CREATE OR REPLACE VIEW contests_activos AS SELECT * FROM contests WHERE activo = TRUE;
CREATE OR REPLACE VIEW equipos_activos AS SELECT * FROM equipos WHERE activo = TRUE;
CREATE OR REPLACE VIEW roles_activos AS SELECT * FROM roles WHERE activo = TRUE;
CREATE OR REPLACE VIEW permisos_activos AS SELECT * FROM permisos WHERE activo = TRUE;
CREATE OR REPLACE VIEW roles_permisos_activas AS SELECT * FROM roles_permisos WHERE activo = TRUE;
CREATE OR REPLACE VIEW miembros_activos AS SELECT * FROM miembros WHERE activo = TRUE;
CREATE OR REPLACE VIEW teams_activos AS SELECT * FROM teams WHERE activo = TRUE;
CREATE OR REPLACE VIEW miembros_team_activas AS SELECT * FROM miembros_team WHERE activo = TRUE;
CREATE OR REPLACE VIEW participantes_contest_activos AS SELECT * FROM participantes_contest WHERE activo = TRUE;
CREATE OR REPLACE VIEW preguntas_activas AS SELECT * FROM preguntas WHERE activo = TRUE;
CREATE OR REPLACE VIEW scientific_articles_activas AS SELECT * FROM scientific_articles WHERE activo = TRUE;
