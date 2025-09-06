USE capsule;

-- Views
CREATE OR REPLACE VIEW students_active AS SELECT * FROM students WHERE active = TRUE;
CREATE OR REPLACE VIEW contestants_active AS SELECT * FROM contestants WHERE active = TRUE;
CREATE OR REPLACE VIEW specialization_areas_active AS SELECT * FROM specialization_areas WHERE active = TRUE;
CREATE OR REPLACE VIEW contestant_areas_active AS SELECT * FROM contestant_areas WHERE active = TRUE;
CREATE OR REPLACE VIEW semesters_active AS SELECT * FROM semesters WHERE active = TRUE;
CREATE OR REPLACE VIEW contests_active AS SELECT * FROM contests WHERE active = TRUE;
CREATE OR REPLACE VIEW teams_active AS SELECT * FROM teams WHERE active = TRUE;
CREATE OR REPLACE VIEW roles_active AS SELECT * FROM roles WHERE active = TRUE;
CREATE OR REPLACE VIEW permissions_active AS SELECT * FROM permissions WHERE active = TRUE;
CREATE OR REPLACE VIEW role_permissions_active AS SELECT * FROM role_permissions WHERE active = TRUE;
CREATE OR REPLACE VIEW members_active AS SELECT * FROM members WHERE active = TRUE;
CREATE OR REPLACE VIEW groups_active AS SELECT * FROM groups WHERE active = TRUE;
CREATE OR REPLACE VIEW group_members_active AS SELECT * FROM group_members WHERE active = TRUE;
CREATE OR REPLACE VIEW contest_teams_active AS SELECT * FROM contest_teams WHERE active = TRUE;
CREATE OR REPLACE VIEW scientific_articles_active AS SELECT * FROM scientific_articles WHERE active = TRUE;
