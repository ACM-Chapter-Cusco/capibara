package model

type ContestantArea struct {
	Id           int  `json:"id" db:"id"`
	ContestantId int  `json:"contestant_id" db:"contestant_id"`
	AreaId       int  `json:"area_id" db:"area_id"`
	Active       bool `json:"active" db:"active"`
}
