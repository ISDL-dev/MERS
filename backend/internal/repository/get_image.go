package repository

import (
	"log"

	"math/rand"
	"time"

	"github.com/hoka-isdl/MERS/backend/internal/schema"
)

func GetImages() []schema.ListImagesInner {
	var images schema.ListImagesInner
	var imagesList []schema.ListImagesInner

	rows_title, err := db.Query("SELECT id, google_drive_id FROM images")
	if err != nil {
		log.Fatal(err.Error())
	}

	for rows_title.Next() {
		err := rows_title.Scan(&images.ImageId, &images.GoogleDriveId)
		if err != nil {
			log.Fatal(err.Error())
		}
		imagesList = append(imagesList, images)
	}

	//シャッフル
	rand.Seed(time.Now().UnixNano())
	rand.Shuffle(len(imagesList), func(i, j int) {
		imagesList[i], imagesList[j] = imagesList[j], imagesList[i]
	})

	return imagesList
}
