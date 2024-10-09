package database

import (
	"database/sql"
	"fmt"
	"time"

	_ "github.com/lib/pq"
)

func NewConnection(databaseURL string) (*sql.DB, error) {
	dsn := databaseURL

	db, err := sql.Open("postgres", dsn)
	if err != nil {
		return nil, fmt.Errorf("error opening database: %w", err)
	}

	db.SetMaxIdleConns(10)
	db.SetMaxOpenConns(25)
	db.SetConnMaxIdleTime(5 * time.Minute)
	db.SetConnMaxLifetime(5 * time.Minute)

	if err := db.Ping(); err != nil {
		return nil, fmt.Errorf("error pinging database: %w", err)
	}

	return db, nil
}
