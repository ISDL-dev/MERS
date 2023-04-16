package repository

import (
	"database/sql"
	// "os"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func Opendb() {
	// mysql_user := os.Getenv("MYSQL_USER")
	// mysql_password := os.Getenv("MYSQL_PASSWORD")
	// mysql_database := os.Getenv("MYSQL_DATABASE")
	// db_name, err := sql.Open("mysql", mysql_user +":"+ mysql_password +"@tcp(127.0.0.1:3306)/"+ mysql_database +"?")
	db_name, err := sql.Open("mysql", "root:root@tcp(127.0.0.1:3306)/mers-db?")

	if err != nil {
		panic(err.Error())
	}

	db = db_name
}