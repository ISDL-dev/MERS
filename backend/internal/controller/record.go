package controller

import (
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"time"

	client "github.com/ISDL-dev/MaP1058-socket-client"
	"github.com/gin-gonic/gin"
)

func getInt64Env(envVar string) int64 {
	valueStr := os.Getenv(envVar)
	valueInt64, err := strconv.ParseInt(valueStr, 10, 64)
	if err != nil {
		fmt.Printf("Failed to convert %s to int64: %v\n", envVar, err)
		os.Exit(1)
	}
	return valueInt64
}

func GetRecordingStartHandlerFunc(ctx *gin.Context) {
	const preratingSecond = 3
	ratingSecondByMedia := getInt64Env("RATING_SECOND")
	mediaNum := getInt64Env("MEDIANUM")
	totalExperimentTime := ratingSecondByMedia*mediaNum + preratingSecond

	wd, err := os.Getwd()
	if err != nil {
		ctx.JSON(500, gin.H{
			"message": err.Error(),
		})
		return
	}
	absSaveDir := filepath.Join(wd, "output")

	conf := client.Config{
		ServerIP: "192.168.10.101",
		SaveDir:  absSaveDir,
	}
	c, err := client.NewClient(conf)
	if err != nil {
		ctx.JSON(500, gin.H{
			"message": err.Error(),
		})
		return
	}

	go func() {
		err = c.Start(time.Second * time.Duration(totalExperimentTime))
		if err != nil {
			ctx.JSON(500, gin.H{
				"message": err.Error(),
			})
			return
		}
	}()

	ctx.JSON(200, gin.H{
		"message": "recording started",
	})
}
