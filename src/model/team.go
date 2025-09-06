package model

type Team struct {
	ID        int    `json:"id" db:"id"`
	Name      string `json:"name" db:"name"`
	Category  string `json:"category" db:"category"`
	Position  int    `json:"position" db:"position"`
	ContestID int    `json:"contest_id" db:"contest_id"`
	Active    bool   `json:"active" db:"active"`
}
