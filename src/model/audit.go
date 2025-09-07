package model

import "time"

type Audit struct {
	Id           int       `json:"id" db:"id"`
	TableName    string    `json:"table_name" db:"table_name"`
	RecordId     int    `json:"record_id" db:"record_id"`
	Action       string `json:"action" db:"action"`
	PreviousData string `json:"previous_data" db:"previous_data"`
	NewData      string `json:"new_data" db:"new_data"`
	MemberId     int    `json:"member_id" db:"member_id"`
	AuditDate    time.Time `json:"audit_date" db:"audit_date"`
}
