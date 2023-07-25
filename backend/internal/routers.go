package internal

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal/controller"
)

func SetRoutes(router *gin.Engine) {
	//TODO:CORS設定を反映
	router.Use(cors.New(cors.Config{
		AllowOrigins: []string{
			"http://localhost:4000",
		},
		AllowOriginFunc:  func(origin string) bool { return true },
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "PATCH"},
		AllowHeaders:     []string{"Origin", "Content-Length", "Content-Type"},
		AllowCredentials: true,
	}))

	router.GET("/ping", controller.PingHandlerFunc)
	router.POST("/trials", controller.PostTrialsHandlerFunc)
	router.GET("/images/:images_num", controller.GetImagesHandlerFunc)
}
