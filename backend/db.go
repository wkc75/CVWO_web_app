package main

import (
	"database/sql"
	"fmt" // for printing
	"os"  //use the read files

	_ "github.com/mattn/go-sqlite3"
)

func initDB() (*sql.DB, error) {
	db, err := sql.Open("sqlite3", "forum.db")
	if err != nil {
		return nil, err
	}

	schema, err := os.ReadFile("schema.sql")
	if err != nil {
		return nil, err
	}

	if _, err := db.Exec(string(schema)); err != nil {
		return nil, err
	}

	fmt.Println("Database initialized.")
	return db, nil
}
