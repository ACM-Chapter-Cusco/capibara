package model

type ContestQuestion struct {
	Id             int    `json:"id" db:"id"`
	ContestId      int    `json:"contest_id" db:"contest_id"`
	QuestionId     int    `json:"question_id" db:"question_id"`
	QuestionLetter string `json:"question_letter" db:"question_letter"`
}
