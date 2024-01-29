package repository

import (
	"database/sql"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func init() {
	log.Println("connect to database")
	openDB()
}

func openDB() {
	var err error
	db, err = sql.Open("mysql", "root:root@tcp(mers-db:3306)/mers-db?")
	if err != nil {
		log.Fatalf("main sql.Open error err:%v", err)
	}
}

func CloseDB() {
	log.Println("disconnect from database")
	db.Close()
}
