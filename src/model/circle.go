package model

type Circle struct {
	Id          int    `json:"id" db:"id"`
	Name        string `json:"name" db:"name"`
	Description string `json:"description" db:"description"`
	Active      bool   `json:"active" db:"active"`
}
