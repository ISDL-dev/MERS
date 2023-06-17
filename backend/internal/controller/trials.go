package controller

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal/repository"
	"github.com/hoka-isdl/MERS/backend/internal/schema"
)

func PostTrialsHandlerFunc(ctx *gin.Context) {
	var trials schema.PostTrialsRequest

	if err := ctx.BindJSON(&trials); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// repository.CreateMediasRecords()//Mediasテーブルに仮の情報を挿入.Mediasテーブルが作成でき次第削除予定
	repository.CreateSubjectsRecords(trials.Subject)
	repository.CreateEmotionsRecords(trials.Subject, trials.Ratings)

	ctx.JSON(200, gin.H{
		"message": "success",
	})

}
