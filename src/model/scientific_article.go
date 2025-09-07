package model

import "time"

type ScientificArticle struct {
	Id              int        `json:"id" db:"id"`
	ArticleTitle    string     `json:"article_title" db:"article_title"`
	Doi             string     `json:"doi" db:"doi"`
	PdfLink         string     `json:"pdf_link" db:"pdf_link"`
	MemberId        int        `json:"member_id" db:"member_id"`
	PublicationDate time.Time `json:"publication_date" db:"publication_date"`
	Active          bool       `json:"active" db:"active"`
}
