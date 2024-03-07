package controller

import (
	"os"
	"path/filepath"
	"time"

	client "github.com/ISDL-dev/MaP1058-socket-client"
	"github.com/gin-gonic/gin"
)

func GetRecordingStartHandlerFunc(ctx *gin.Context) {
	const ratingSecondByMedia = 15
	const preratingSecond = 3
	const mediaNum = 120
	const totalExperimentTime = ratingSecondByMedia*mediaNum + preratingSecond

	wd, err := os.Getwd()
	if err != nil {
		ctx.JSON(500, gin.H{
			"message": err.Error(),
		})
		return
	}
	absSaveDir := filepath.Join(wd, "output")

	conf := client.Config{
		ServerIP: "192.168.10.129",
		SaveDir:  absSaveDir,
	}
	c, err := client.NewClient(conf)
	if err != nil {
		ctx.JSON(500, gin.H{
			"message": err.Error(),
		})
		return
	}

	err = c.Start(time.Minute * totalExperimentTime)
	if err != nil {
		ctx.JSON(500, gin.H{
			"message": err.Error(),
		})
		return
	}

	ctx.JSON(200, gin.H{
		"message": "Map1058 was successfully recorded",
	})
}
