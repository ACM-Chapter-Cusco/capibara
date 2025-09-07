package model

import "time"

type CircleMember struct {
	Id            int        `json:"id" db:"id"`
	MemberId      int        `json:"member_id" db:"member_id"`
	CircleId      int        `json:"circle_id" db:"circle_id"`
	IsLeader      bool       `json:"is_leader" db:"is_leader"`
	MemberStatus  bool       `json:"member_status" db:"member_status"`
	InclusionDate time.Time `json:"inclusion_date" db:"inclusion_date"`
	Active        bool       `json:"active" db:"active"`
}
