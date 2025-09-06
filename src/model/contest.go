package model

import "time"

type Contest struct {
	ID          int        `json:"id" db:"id"`
	Edition     string     `json:"edition" db:"edition"`
	Description string     `json:"description" db:"description"`
	Year        int        `json:"year" db:"year"`
	SemesterID  int        `json:"semester_id" db:"semester_id"`
	ContestDate time.Time `json:"contest_date" db:"contest_date"`
	Active      bool       `json:"active" db:"active"`
}
