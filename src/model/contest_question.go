package model

type ContestQuestion struct {
	ID             int    `json:"id" db:"id"`
	ContestID      int    `json:"contest_id" db:"contest_id"`
	QuestionID     int    `json:"question_id" db:"question_id"`
	QuestionLetter string `json:"question_letter" db:"question_letter"`
}
