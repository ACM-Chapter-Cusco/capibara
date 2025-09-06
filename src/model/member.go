package model

type Member struct {
	ID             int    `json:"id" db:"id"`
	Username       string `json:"username" db:"username"`
	GithubUsername string `json:"github_username" db:"github_username"`
	Password       string `json:"password" db:"password"`
	StudentID      int    `json:"student_id" db:"student_id"`
	RoleID         int    `json:"role_id" db:"role_id"`
	Active         bool   `json:"active" db:"active"`
}
