package model

type Team struct {
	Id        int    `json:"id" db:"id"`
	Name      string `json:"name" db:"name"`
	Category  string `json:"category" db:"category"`
	Position  int    `json:"position" db:"position"`
	ContestId int    `json:"contest_id" db:"contest_id"`
	Active    bool   `json:"active" db:"active"`
}
