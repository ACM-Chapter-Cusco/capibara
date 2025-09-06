package model

type ContestantArea struct {
	ID           int  `json:"id" db:"id"`
	ContestantID int  `json:"contestant_id" db:"contestant_id"`
	AreaID       int  `json:"area_id" db:"area_id"`
	Active       bool `json:"active" db:"active"`
}
