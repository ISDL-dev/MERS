package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/hoka-isdl/MERS/backend/internal"
	"github.com/hoka-isdl/MERS/backend/internal/repository"
)

const (
	timeout = time.Second * 5
)

func init(){
	repository.OpenDB()
}

func main() {
	router := gin.Default()
	internal.SetRoutes(router)
	srv := http.Server{
		Addr:    ":3000",
		Handler: router,
	}

	go func() {
		if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalln(err)
		}
	}()

	// シグナルの待機
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	log.Println("server shutdown...")

	// 5秒間のタイムアウト制限を設けてサーバーの停止処理を開始
	ctx, cancel := context.WithTimeout(context.Background(), timeout)
	defer cancel()
	if err := srv.Shutdown(ctx); err != nil {
		log.Fatalf("failed to shutdown server: %s", err.Error())
		return
	}

	select {
	case <-ctx.Done():
		log.Printf("timeout of %f seconds", timeout.Seconds())
	}

	log.Println("server exited...")
}
