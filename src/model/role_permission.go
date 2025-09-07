package model

type RolePermission struct {
	Id           int  `json:"id" db:"id"`
	RoleId       int  `json:"role_id" db:"role_id"`
	PermissionId int  `json:"permission_id" db:"permission_id"`
	Active       bool `json:"active" db:"active"`
}
