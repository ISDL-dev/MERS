package controller

import (
	"log"
	"net/http"

	"github.com/ISDL-dev/MERS/backend/internal/model"
	"github.com/ISDL-dev/MERS/backend/internal/repository"
	"github.com/ISDL-dev/MERS/backend/internal/schema"
	"github.com/gin-gonic/gin"
)

func PostTrialsHandlerFunc(ctx *gin.Context) {
	var trials schema.PostTrialsRequest

	if err := ctx.BindJSON(&trials); err != nil {
		log.Printf("Internal Server Error: failed to bind a request body with a struct: %v\n", err)
		ctx.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// TODO: locationやplatformが予め定義されたものかどうかをチェックする
	// TODO: media_typeが予め定義されたものかどうかをチェックする

	trialId, err := repository.CreateTrial(trials)
	if err != nil {
		log.Printf("Internal Server Error: failed to create a trial record: %v\n", err)
		ctx.Status(http.StatusInternalServerError)
		return
	}

	if err := repository.CreateSubject(trialId, trials.SubjectMetadata); err != nil {
		log.Printf("Internal Server Error: failed to create a subject record: %v\n", err)
		ctx.Status(http.StatusInternalServerError)
		return
	}

	// TODO: MaP1058と通信をしてsignalを作成する
	// TODO: signal型はMaP1058のクライアントライブラリで定義されたものを使う
	signal := model.Signal{}
	if err := repository.CreateSignal(trialId, signal); err != nil {
		log.Printf("Internal Server Error: failed to create a signal record: %v\n", err)
		ctx.Status(http.StatusInternalServerError)
		return
	}

	switch trials.RatingSet.MediaType {
	case "image":
		for _, rate := range trials.RatingSet.Rating {
			imageId, err := repository.GetImageId(rate.Dataset, rate.Filename)
			if err != nil {
				log.Printf("Internal Server Error: failed to get image_id: %v\n", err)
				ctx.Status(http.StatusInternalServerError)
				return
			}
			if err := repository.CreateImageRating(trialId, imageId, rate.Emotion); err != nil {
				log.Printf("Internal Server Error: failed to create a rate record: %v\n", err)
				ctx.Status(http.StatusInternalServerError)
				return
			}
		}
	case "video":
		for _, rate := range trials.RatingSet.Rating {
			movieId, err := repository.GetMovieId(rate.Dataset, rate.Filename)
			if err != nil {
				log.Printf("Internal Server Error: failed to get movie_id: %v\n", err)
				ctx.Status(http.StatusInternalServerError)
				return
			}
			if err := repository.CreateMovieRating(trialId, movieId, rate.Emotion); err != nil {
				log.Printf("Internal Server Error: failed to create a rate record: %v\n", err)
				ctx.Status(http.StatusInternalServerError)
				return
			}
		}
	default:
		log.Printf("Bad Request: invalid media type: %v\n", trials.RatingSet.MediaType)
		ctx.String(http.StatusBadRequest, "invalid media type")
		return
	}

	ctx.JSON(200, gin.H{
		"message": "success",
	})
}
