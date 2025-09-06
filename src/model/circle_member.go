package model

import "time"

type CircleMember struct {
	ID            int        `json:"id" db:"id"`
	MemberID      int        `json:"member_id" db:"member_id"`
	CircleID      int        `json:"circle_id" db:"circle_id"`
	IsLeader      bool       `json:"is_leader" db:"is_leader"`
	MemberStatus  bool       `json:"member_status" db:"member_status"`
	InclusionDate time.Time `json:"inclusion_date" db:"inclusion_date"`
	Active        bool       `json:"active" db:"active"`
}
