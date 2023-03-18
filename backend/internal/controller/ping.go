package controller

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func PingHandlerFunc(ctx *gin.Context) {
	ctx.String(http.StatusOK, "pong")
}
