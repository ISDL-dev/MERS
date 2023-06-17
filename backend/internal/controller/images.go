package controller

import (
	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal/repository"
	"github.com/hoka-isdl/MERS/backend/internal/schema"
)

func GetImagesHandlerFunc(ctx *gin.Context) {
	var imageslist []schema.ListImagesInner
	imageslist = repository.GetImages()

	ctx.JSON(200, gin.H{
		"content": imageslist,
	})

}
