-- user database
DROP USER 'capsule'@'localhost';
CREATE USER 'capsule'@'localhost' IDENTIFIED BY 'capsule';
GRANT ALL PRIVILEGES ON capsule.* TO 'capsule'@'localhost';
FLUSH PRIVILEGES;

-- database
DROP DATABASE IF EXISTS capsule;
CREATE DATABASE capsule;
USE capsule;

-- Table: students
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_code VARCHAR(255) NOT NULL,
    first_names VARCHAR(255) NOT NULL,
    paternal_surname VARCHAR(255) NOT NULL,
    maternal_surname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_student_code (student_code)
) ENGINE=InnoDB;

-- Table: contestants
CREATE TABLE contestants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    language VARCHAR(255),
    student_id INT,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES students(id)
) ENGINE=InnoDB;

-- Table: specialization_areas
CREATE TABLE specialization_areas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_area_name (name)
) ENGINE=InnoDB;

-- Table: contestant_areas
CREATE TABLE contestant_areas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contestant_id INT NOT NULL,
    area_id INT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_contestant_id FOREIGN KEY (contestant_id) REFERENCES contestants(id),
    CONSTRAINT fk_area_id FOREIGN KEY (area_id) REFERENCES specialization_areas(id),
    UNIQUE KEY uk_contestant_area (contestant_id, area_id)
) ENGINE=InnoDB;

-- Table: semesters
CREATE TABLE semesters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- Table: contests
CREATE TABLE contests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    edition VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    year INT NOT NULL,
    semester_id INT NOT NULL,
    contest_date TIMESTAMP NULL,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_semester_id FOREIGN KEY (semester_id) REFERENCES semesters(id),
    UNIQUE KEY uk_edition (edition)
) ENGINE=InnoDB;

-- Table: teams
CREATE TABLE teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    position INT,
    contest_id INT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_contest_id FOREIGN KEY (contest_id) REFERENCES contests(id),
    UNIQUE KEY uk_team_name (name)
) ENGINE=InnoDB;

-- Table: roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_role_name (name)
) ENGINE=InnoDB;

-- Table: permissions
CREATE TABLE permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_permission_name (name)
) ENGINE=InnoDB;

-- Table: role_permissions
CREATE TABLE role_permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT NOT NULL,
    permission_id INT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES roles(id),
    CONSTRAINT fk_permission_id FOREIGN KEY (permission_id) REFERENCES permissions(id),
    UNIQUE KEY uk_role_permission (role_id, permission_id)
) ENGINE=InnoDB;

-- Table: members
CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    github_username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    student_id INT,
    role_id INT,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_member_student_id FOREIGN KEY (student_id) REFERENCES students(id),
    CONSTRAINT fk_member_role_id FOREIGN KEY (role_id) REFERENCES roles(id),
    UNIQUE KEY uk_username (username)
) ENGINE=InnoDB;

-- Table: groups
CREATE TABLE groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    UNIQUE KEY uk_group_name (name)
) ENGINE=InnoDB;

-- Table: group_members
CREATE TABLE group_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    group_id INT NOT NULL,
    is_leader BOOLEAN DEFAULT false,
    member_status BOOLEAN DEFAULT true,
    inclusion_date TIMESTAMP NULL,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES members(id),
    CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES groups(id),
    UNIQUE KEY uk_member_group (member_id, group_id)
) ENGINE=InnoDB;

-- Table: contest_teams
CREATE TABLE contest_teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contest_id INT NOT NULL,
    team_id INT NOT NULL,
    contestant_id INT NOT NULL,
    university VARCHAR(255) NOT NULL,
    semester INT NOT NULL,
    credits INT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_participant_team_id FOREIGN KEY (team_id) REFERENCES teams(id),
    CONSTRAINT fk_participant_contestant_id FOREIGN KEY (contestant_id) REFERENCES contestants(id),
    CONSTRAINT fk_participant_contest_id FOREIGN KEY (contest_id) REFERENCES contests(id),
    UNIQUE KEY uk_participant_team_contest (team_id, contestant_id, contest_id)
) ENGINE=InnoDB;

-- Table: questions
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    information TEXT NOT NULL,
    link VARCHAR(255) NOT NULL,
    json_file TEXT NOT NULL,
    active BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- Table: contest_questions
CREATE TABLE contest_questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contest_id INT NOT NULL,
    question_id INT NOT NULL,
    question_letter VARCHAR(255) NOT NULL,
    CONSTRAINT fk_contest_questions_contest_id FOREIGN KEY (contest_id) REFERENCES contests(id),
    CONSTRAINT fk_contest_questions_question_id FOREIGN KEY (question_id) REFERENCES questions(id),
    UNIQUE KEY uk_contest_question (contest_id, question_id)
) ENGINE=InnoDB;

-- Table: scientific_articles
CREATE TABLE scientific_articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    article_title TEXT NOT NULL,
    doi VARCHAR(255) NOT NULL,
    pdf_link VARCHAR(255) NOT NULL,
    member_id INT NOT NULL,
    publication_date TIMESTAMP NULL,
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_article_member_id FOREIGN KEY (member_id) REFERENCES members(id),
    UNIQUE KEY uk_member_doi (member_id, doi)
) ENGINE=InnoDB;

-- Table: audit
CREATE TABLE audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    record_id INT,
    action ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    previous_data TEXT,
    new_data TEXT,
    member_id INT,
    audit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_audit_member FOREIGN KEY (member_id) REFERENCES members(id)
) ENGINE=InnoDB;
