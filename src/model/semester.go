package model

type Semester struct {
	ID     int    `json:"id" db:"id"`
	Name   string `json:"name" db:"name"`
	Active bool   `json:"active" db:"active"`
}
