package model

type Contestant struct {
	Id        int    `json:"id" db:"id"`
	Language  string `json:"language" db:"language"`
	StudentId int    `json:"student_id" db:"student_id"`
	Active    bool   `json:"active" db:"active"`
}
