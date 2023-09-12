package controller

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal/repository"
	"github.com/hoka-isdl/MERS/backend/internal/schema"
)

func PostTrialsHandlerFunc(ctx *gin.Context) {
	var trials schema.PostTrialsRequest

	if err := ctx.BindJSON(&trials); err != nil {
		log.Printf("Internal Server Error: failed to bind a request body with a struct: %v\n", err)
		ctx.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	fmt.Println(trials)
	// repository.CreateMediasRecords()//Mediasテーブルに仮の情報を挿入.Mediasテーブルが作成でき次第削除予定
	if err := repository.CreateSubjectsRecords(trials.Subject); err != nil {
		log.Printf("Internal Server Error: failed to create a subject record: %v\n", err)
		ctx.Status(http.StatusInternalServerError)
		return
	}

	if err := repository.CreateEmotionsRecords(trials.Subject, trials.Ratings); err != nil {
		log.Printf("Internal Server Error: failed to create emotion records: %v\n", err)
		ctx.Status(http.StatusInternalServerError)
		return
	}

	ctx.JSON(200, gin.H{
		"message": "success",
	})

}
