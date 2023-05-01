package repository

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func OpenDB() {
	db_name, err := sql.Open("mysql", "root:root@tcp(127.0.0.1:3306)/mers-db?")
	if err != nil {
		panic(err.Error())
	}

	db = db_name
}

func CloseDB(){
	db.Close()
}