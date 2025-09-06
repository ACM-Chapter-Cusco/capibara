package model

type ContestTeam struct {
	ID           int    `json:"id" db:"id"`
	ContestID    int    `json:"contest_id" db:"contest_id"`
	TeamID       int    `json:"team_id" db:"team_id"`
	ContestantID int    `json:"contestant_id" db:"contestant_id"`
	University   string `json:"university" db:"university"`
	Semester     int    `json:"semester" db:"semester"`
	Credits      int    `json:"credits" db:"credits"`
	Active       bool   `json:"active" db:"active"`
}
