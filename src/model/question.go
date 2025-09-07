package model

type Question struct {
	Id          int    `json:"id" db:"id"`
	Information string `json:"information" db:"information"`
	Link        string `json:"link" db:"link"`
	JsonFile    string `json:"json_file" db:"json_file"`
	Active      bool   `json:"active" db:"active"`
}
