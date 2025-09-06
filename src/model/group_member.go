package model

import "time"

type GroupMember struct {
	ID            int        `json:"id" db:"id"`
	MemberID      int        `json:"member_id" db:"member_id"`
	GroupID       int        `json:"group_id" db:"group_id"`
	IsLeader      bool       `json:"is_leader" db:"is_leader"`
	MemberStatus  bool       `json:"member_status" db:"member_status"`
	InclusionDate time.Time `json:"inclusion_date" db:"inclusion_date"`
	Active        bool       `json:"active" db:"active"`
}
