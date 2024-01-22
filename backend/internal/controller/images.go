package controller

import (
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/ISDL-dev/MERS/backend/internal/repository"
	"github.com/gin-gonic/gin"
)

func GetImagesHandlerFunc(ctx *gin.Context) {
	var numImages int

	numImages, _ = strconv.Atoi(ctx.Param("num_images"))
	imagesList, err := repository.RandGetImages(numImages)
	if err != nil {
		log.Println(fmt.Errorf("failed to send images to the client:%w", err))
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": fmt.Errorf("failed to send images to the client:%w", err),
		})
	} else {
		ctx.JSON(http.StatusOK, gin.H{
			"content": imagesList,
		})
	}
}
