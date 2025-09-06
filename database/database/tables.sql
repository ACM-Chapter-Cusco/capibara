-- user database
DROP USER 'capsule'@'localhost';
CREATE USER 'capsule'@'localhost' IDENTIFIED BY 'capsule';
GRANT ALL PRIVILEGES ON capsule.* TO 'capsule'@'localhost';
FLUSH PRIVILEGES;

-- database
DROP DATABASE IF EXISTS capsule;
CREATE DATABASE capsule;
USE capsule;

-- Tabla: alumnos
CREATE TABLE alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(255) NOT NULL,
    nombres VARCHAR(255) NOT NULL,
    apellido_paterno VARCHAR(255) NOT NULL,
    apellido_materno VARCHAR(255) NOT NULL,
    numero_telefono VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_codigo (codigo)
) ENGINE=InnoDB;

-- Tabla: alumnos_competidores
CREATE TABLE alumnos_competidores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lenguaje_dominio VARCHAR(255),
    id_alumno INT,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos(id)
) ENGINE=InnoDB;

-- Tabla: areas_especialidad
CREATE TABLE areas_especialidad (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre_area VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_nombre_area (nombre_area)
) ENGINE=InnoDB;

-- Tabla: alumnos_competidores_areas
CREATE TABLE alumnos_competidores_areas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_alumno_competidor INT NOT NULL,
    id_area BIGINT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_alumno_competidor FOREIGN KEY (id_alumno_competidor) REFERENCES alumnos_competidores(id),
    CONSTRAINT fk_id_area FOREIGN KEY (id_area) REFERENCES areas_especialidad(id),
    UNIQUE KEY uk_alumno_area (id_alumno_competidor, id_area)
) ENGINE=InnoDB;

-- Tabla: semestre
CREATE TABLE semestre (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre_semestre VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- Tabla: contests
CREATE TABLE contests (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    edicion VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    fecha TIMESTAMP NULL,
    anio INT NOT NULL,
    id_semestre BIGINT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_semestre FOREIGN KEY (id_semestre) REFERENCES semestre(id),
    UNIQUE KEY uk_edicion (edicion)
) ENGINE=InnoDB;

-- Tabla: equipos
CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    puesto INT,
    id_contest BIGINT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_contest FOREIGN KEY (id_contest) REFERENCES contests(id),
    UNIQUE KEY uk_nombre_equipo (nombre_equipo)
) ENGINE=InnoDB;

-- Tabla: roles
CREATE TABLE roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_nombre_rol (nombre_rol)
) ENGINE=InnoDB;

-- Tabla: permisos
CREATE TABLE permisos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre_permiso VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_nombre_permiso (nombre_permiso)
) ENGINE=InnoDB;

-- Tabla: roles_permisos
CREATE TABLE roles_permisos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_rol BIGINT NOT NULL,
    id_permiso BIGINT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_rol FOREIGN KEY (id_rol) REFERENCES roles(id),
    CONSTRAINT fk_id_permiso FOREIGN KEY (id_permiso) REFERENCES permisos(id),
    UNIQUE KEY uk_rol_permiso (id_rol, id_permiso)
) ENGINE=InnoDB;

-- Tabla: miembros
CREATE TABLE miembros (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    github_username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    id_alumno INT,
    id_rol BIGINT,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos(id),
    CONSTRAINT fk_id_rol FOREIGN KEY (id_rol) REFERENCES roles(id),
    UNIQUE KEY uk_username (username)
) ENGINE=InnoDB;

-- Tabla: teams
CREATE TABLE teams (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre_team VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_nombre_team (nombre_team)
) ENGINE=InnoDB;

-- Tabla: miembros_team
CREATE TABLE miembros_team (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha_inclusion TIMESTAMP NULL,
    es_lider BOOLEAN DEFAULT false,
    estado_miembro BOOLEAN DEFAULT true,
    id_miembro BIGINT NOT NULL,
    id_team BIGINT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_miembro FOREIGN KEY (id_miembro) REFERENCES miembros(id),
    CONSTRAINT fk_id_team FOREIGN KEY (id_team) REFERENCES teams(id),
    UNIQUE KEY uk_miembro_team (id_miembro, id_team)
) ENGINE=InnoDB;

-- Tabla: participantes_contest
CREATE TABLE participantes_contest (
    id INT AUTO_INCREMENT PRIMARY KEY,
    universidad VARCHAR(255) NOT NULL,
    semestre VARCHAR(255) NOT NULL,
    creditos INT NOT NULL,
    id_equipo INT NOT NULL,
    id_alumno_competidor INT NOT NULL,
    id_contest BIGINT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_equipo FOREIGN KEY (id_equipo) REFERENCES equipos(id),
    CONSTRAINT fk_id_alumno_competidor FOREIGN KEY (id_alumno_competidor) REFERENCES alumnos_competidores(id),
    CONSTRAINT fk_id_contest FOREIGN KEY (id_contest) REFERENCES contests(id),
    UNIQUE KEY uk_participante_equipo_contest (id_equipo, id_alumno_competidor, id_contest)
) ENGINE=InnoDB;

-- Tabla: preguntas
CREATE TABLE preguntas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    letra_pregunta VARCHAR(255) NOT NULL,
    info_pregunta VARCHAR(255) NOT NULL,
    id_contest BIGINT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_contest FOREIGN KEY (id_contest) REFERENCES contests(id),
    UNIQUE KEY uk_letra_contest (letra_pregunta, id_contest)
) ENGINE=InnoDB;

-- Tabla: scientific_articles
CREATE TABLE scientific_articles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo_articulo VARCHAR(255) NOT NULL,
    doi VARCHAR(255) NOT NULL,
    pdf_link VARCHAR(255) NOT NULL,
    fecha_publicacion TIMESTAMP NULL,
    id_miembro BIGINT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_id_miembro FOREIGN KEY (id_miembro) REFERENCES miembros(id),
    UNIQUE KEY uk_miembro_doi (id_miembro, doi)
) ENGINE=InnoDB;

-- Tabla: auditoria
CREATE TABLE auditoria (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tabla VARCHAR(255) NOT NULL,
    id_registro BIGINT,
    accion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    datos_anteriores JSON,
    datos_nuevos JSON,
    id_usuario BIGINT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_auditoria_usuario FOREIGN KEY (id_usuario) REFERENCES miembros(id)
) ENGINE=InnoDB;
