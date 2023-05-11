package repository

import (
	"log"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func init() {
	log.Println("connect to database")
	openDB()
}

func openDB() {
	db_name, err := sql.Open("mysql", "root:root@tcp(127.0.0.1:3306)/mers-db?")
	if err != nil {
		panic(err.Error())
	}

	db = db_name
}

func CloseDB() {
	log.Println("disconnect from database")
	db.Close()
}