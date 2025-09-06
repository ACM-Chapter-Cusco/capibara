package model

type Contestant struct {
	ID        int    `json:"id" db:"id"`
	Language  string `json:"language" db:"language"`
	StudentID int    `json:"student_id" db:"student_id"`
	Active    bool   `json:"active" db:"active"`
}
