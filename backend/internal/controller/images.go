package controller

import (
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal/repository"
)

func GetImagesHandlerFunc(ctx *gin.Context) {
	var numImages int

	numImages, _ = strconv.Atoi(ctx.Param("numImages"))
	imagesList, err := repository.RandGetImages(numImages)
	if err != nil {
		log.Println(err.Error())
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
	} else {
		ctx.JSON(http.StatusOK, gin.H{
			"content": imagesList,
		})
	}
}
