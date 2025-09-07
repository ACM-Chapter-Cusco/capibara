package connection

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"

	"github.com/ACM-Chapter-Cusco/capibara/src/config"
	"github.com/ACM-Chapter-Cusco/capibara/src/tracer"
)

var log = tracer.Logger()

type Connection struct {
	Db *sql.DB
}

func NewConnection(config *config.Config) (*Connection, error) {
	log.Info("Initializing database connection")

	connectionString := config.GetStringDBConnection()
	
	db, err := sql.Open(config.Database.Driver, connectionString)
	if err != nil {
		return nil, err
	}

	if err := db.Ping(); err != nil {
		return nil, fmt.Errorf("cannot connect to database: %v", err)
	}

	log.Infof("Connected to database successfully!")

	connection := &Connection{
		Db: db,
	}

	return connection, nil
}

func (c *Connection) Close() error {
	return c.Db.Close()
}