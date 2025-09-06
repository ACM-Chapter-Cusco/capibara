package model

type Student struct {
	ID               int    `json:"id" db:"id"`
	StudentCode      string `json:"student_code" db:"student_code"`
	FirstNames       string `json:"first_names" db:"first_names"`
	PaternalSurname  string `json:"paternal_surname" db:"paternal_surname"`
	MaternalSurname  string `json:"maternal_surname" db:"maternal_surname"`
	Email            string `json:"email" db:"email"`
	PhoneNumber      string `json:"phone_number" db:"phone_number"`
	Active           bool   `json:"active" db:"active"`
}
