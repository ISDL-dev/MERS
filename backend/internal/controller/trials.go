package controller

import (
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

	// TODO: CreateTrialsRecords()を呼び出す
	if err := repository.CreateSubjectsRecords(trials.Subject); err != nil {
		log.Printf("Internal Server Error: failed to create a subject record: %v\n", err)
		ctx.Status(http.StatusInternalServerError)
		return
	}

	// TODO: CreateSignalsRecords()を呼び出す
	// TODO: リクエストから得られるmedia_idが画像なのか動画なのかを判別する

	ctx.JSON(200, gin.H{
		"message": "success",
	})

}
