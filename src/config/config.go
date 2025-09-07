package config

import (
	"fmt"
	"os"
)

const (
	ModeDev  = "dev"
	ModeProd = "prod"
)

type Server struct {
	Host string `json:"host"`
	Port string `json:"port"`
}

type Database struct {
	Driver   string `json:"driver"`
	Name     string `json:"name"`
	Username string `json:"username"`
	Password string `json:"password"`
	Protocol string `json:"protocol"`
	Host     string `json:"host"`
	Port     string `json:"port"`
}

type Config struct {
	Mode     string   `json:"mode"`
	Server   Server   `json:"server"`
	Database Database `json:"database"`
}

func NewConfiguration() *Config {
	return &Config{
		Mode: os.Getenv("MODE"),
		Server: Server{
			Port: "8080",
		},
		Database: Database{
			Driver:   "mysql",
			Name:     os.Getenv("DB_NAME"),
			Username: os.Getenv("DB_USER"),
			Password: os.Getenv("DB_PASSWORD"),
			Protocol: "tcp",
			Host:     os.Getenv("DB_HOST"),
			Port:     os.Getenv("DB_PORT"),
		},
	}
}

func (c *Config) GetStringDBConnection() string {
	if c.Mode == ModeProd {
		return fmt.Sprintf("%s:%s@unix(/cloudsql/%s)/%s",
			c.Database.Username,
			c.Database.Password,
			c.Database.Host,
			c.Database.Name,
		)
	}

	return fmt.Sprintf("%s:%s@tcp(%s:%s)/%s",
		c.Database.Username,
		c.Database.Password,
		c.Database.Host,
		c.Database.Port,
		c.Database.Name,
	)
}
