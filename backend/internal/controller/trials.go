package controller

import (
	"net/http"
	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal/schema"
	"github.com/hoka-isdl/MERS/backend/internal/repository"
)

func PostTrialsHandlerFunc(ctx *gin.Context) {
	var trials openapi.TrialsPostRequest

	if err := ctx.BindJSON(&trials); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	repository.CreateMediasTables()//Mediasテーブルに仮の情報を挿入
	repository.CreateSubjectsTables(trials.Subject)
	repository.CreateEmotionsTables(trials.Subject,trials.Ratings)

	ctx.JSON(200, gin.H{
		"message": "success",
	})

}
