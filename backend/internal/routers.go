package internal

import (
	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal/controller"
)

func SetRoutes(router *gin.Engine) {
	router.GET("/ping", controller.PingHandlerFunc)
}
