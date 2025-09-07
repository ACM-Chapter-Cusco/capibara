package model

type Member struct {
	Id             int      `json:"id" db:"id"`
	Username       string   `json:"username" db:"username"`
	GithubUsername string   `json:"github_username" db:"github_username"`
	Password       string   `json:"password" db:"password"`
	StudentId      int      `json:"student_id" db:"student_id"`
	RoleId         int      `json:"role_id" db:"role_id"`
	Active         bool     `json:"active" db:"active"`
	Student        *Student `json:"student,omitempty"`
	Role           *Role    `json:"role,omitempty"`
}
