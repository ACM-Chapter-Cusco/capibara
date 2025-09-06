package model

import "time"

type ScientificArticle struct {
	ID              int        `json:"id" db:"id"`
	ArticleTitle    string     `json:"article_title" db:"article_title"`
	DOI             string     `json:"doi" db:"doi"`
	PDFLink         string     `json:"pdf_link" db:"pdf_link"`
	MemberID        int        `json:"member_id" db:"member_id"`
	PublicationDate time.Time `json:"publication_date" db:"publication_date"`
	Active          bool       `json:"active" db:"active"`
}
