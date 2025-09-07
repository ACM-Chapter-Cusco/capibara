package model

type ContestTeam struct {
	Id           int    `json:"id" db:"id"`
	ContestId    int    `json:"contest_id" db:"contest_id"`
	TeamId       int    `json:"team_id" db:"team_id"`
	ContestantId int    `json:"contestant_id" db:"contestant_id"`
	University   string `json:"university" db:"university"`
	Semester     int    `json:"semester" db:"semester"`
	Credits      int    `json:"credits" db:"credits"`
	Active       bool   `json:"active" db:"active"`
}
