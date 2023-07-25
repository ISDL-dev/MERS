package controller

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal/repository"
)

func GetImagesHandlerFunc(ctx *gin.Context) {
	var images_num int

	images_num, _ = strconv.Atoi(ctx.Param("images_num"))
	imagesList, err := repository.RandGetImages(images_num)

	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
	} else {
		ctx.JSON(http.StatusOK, gin.H{
			"content": imagesList,
		})
	}
}
