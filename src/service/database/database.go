package database

import (
	"database/sql"

	"github.com/ACM-Chapter-Cusco/capibara/src/connection"
	"github.com/ACM-Chapter-Cusco/capibara/src/model"
	"github.com/ACM-Chapter-Cusco/capibara/src/tracer"
)

var log = tracer.Logger()

type Service interface {
	ListMembers() ([]model.Member, error)
	GetMember(id string) (*model.Member, error)
}

type databaseService struct {
	conn *connection.Connection
}

func NewService(conn *connection.Connection) Service {
	return &databaseService{
		conn: conn,
	}
}

func (ds *databaseService) GetMember(id string) (*model.Member, error) {
	query := `SELECT m.id, m.username, m.github_username, m.password, m.student_id, m.role_id, m.active,
              COALESCE(s.id, 0), COALESCE(s.student_code, ''), COALESCE(s.first_names, ''),
              COALESCE(s.paternal_surname, ''), COALESCE(s.maternal_surname, ''),
              COALESCE(s.email, ''), COALESCE(s.phone_number, ''), COALESCE(s.active, false),
              COALESCE(r.id, 0), COALESCE(r.name, ''), COALESCE(r.active, false)
              FROM members m
              LEFT JOIN students s ON m.student_id = s.id
              LEFT JOIN roles r ON m.role_id = r.id
              WHERE m.id = ? AND m.active = TRUE`

	var member model.Member
	var studentData model.Student
	var roleData model.Role

	err := ds.conn.Db.QueryRow(query, id).Scan(&member.Id, &member.Username, &member.GithubUsername, &member.Password,
		&member.StudentId, &member.RoleId, &member.Active,
		&studentData.Id, &studentData.StudentCode, &studentData.FirstNames,
		&studentData.PaternalSurname, &studentData.MaternalSurname,
		&studentData.Email, &studentData.PhoneNumber, &studentData.Active,
		&roleData.Id, &roleData.Name, &roleData.Active)

	if err != nil {
		if err == sql.ErrNoRows {
			return nil, err
		}
		log.Errorf("Get member query failed: %s", err)
		return nil, err
	}

	member.Student = &studentData
	member.Role = &roleData
	return &member, nil
}

func (ds *databaseService) ListMembers() ([]model.Member, error) {
	query := `SELECT m.id, m.username, m.github_username, m.password, m.student_id, m.role_id, m.active,
              COALESCE(s.id, 0), COALESCE(s.student_code, ''), COALESCE(s.first_names, ''),
              COALESCE(s.paternal_surname, ''), COALESCE(s.maternal_surname, ''),
              COALESCE(s.email, ''), COALESCE(s.phone_number, ''), COALESCE(s.active, false),
              COALESCE(r.id, 0), COALESCE(r.name, ''), COALESCE(r.active, false)
              FROM members m
              LEFT JOIN students s ON m.student_id = s.id
              LEFT JOIN roles r ON m.role_id = r.id
              WHERE m.active = TRUE`

	rows, err := ds.conn.Db.Query(query)
	if err != nil {
		log.Errorf("List members query failed: %s", err)
		return nil, err
	}
	defer rows.Close()

	var members []model.Member
	for rows.Next() {
		var member model.Member
		var studentData model.Student
		var roleData model.Role

		err = rows.Scan(&member.Id, &member.Username, &member.GithubUsername, &member.Password,
			&member.StudentId, &member.RoleId, &member.Active,
			&studentData.Id, &studentData.StudentCode, &studentData.FirstNames,
			&studentData.PaternalSurname, &studentData.MaternalSurname,
			&studentData.Email, &studentData.PhoneNumber, &studentData.Active,
			&roleData.Id, &roleData.Name, &roleData.Active)

		if err != nil {
			log.Errorf("Member scan failed: %s", err)
			return nil, err
		}

		member.Student = &studentData
		member.Role = &roleData
		members = append(members, member)
	}

	return members, nil
}
