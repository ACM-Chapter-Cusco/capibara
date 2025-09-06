package model

type RolePermission struct {
	ID           int  `json:"id" db:"id"`
	RoleID       int  `json:"role_id" db:"role_id"`
	PermissionID int  `json:"permission_id" db:"permission_id"`
	Active       bool `json:"active" db:"active"`
}
