package controller

import (
	// "time"

	// client "github.com/ISDL-dev/MaP1058-socket-client"
	"github.com/gin-gonic/gin"
)

func GetRecordingStartHandlerFunc(ctx *gin.Context) {
	const ratingSecondByMedia = 15
	const preratingSecond = 3
	const mediaNum = 120
	const totalExperimentTime = ratingSecondByMedia*mediaNum + preratingSecond

	// conf := client.Config{
	// 	ServerIP: "192.168.10.101",
	// 	SaveDir:  "../output/",
	// }
	// c, _ := client.NewClient(conf)
	// c.Start(time.Minute * totalExperimentTime)

	ctx.JSON(200, gin.H{
		"message": "Map1058 was successfully recorded",
	})
}
