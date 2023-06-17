package repository

import (
	"fmt"
	"log"

	"math/rand"
	"time"

	"github.com/hoka-isdl/MERS/backend/internal/schema"
)

func GetImages() []schema.ListImagesInner {
	var images schema.ListImagesInner
	var imageslist []schema.ListImagesInner

	rows_title, err := db.Query("SELECT id, google_drive_id FROM images")

	if err != nil {
		log.Fatal(err.Error())
	}

	fmt.Println(rows_title)
	for rows_title.Next() {
		rows_title.Scan(&images.ImageId, &images.GoogleDriveId)
		// imagesJson, err := json.Marshal(images)
		if err != nil {
			log.Fatal(err.Error())
		}
		imageslist = append(imageslist, images)
	}

	rand.Seed(time.Now().UnixNano())
	rand.Shuffle(len(imageslist), func(i, j int) {
		imageslist[i], imageslist[j] = imageslist[j], imageslist[i]
	})
	fmt.Println(imageslist)

	return imageslist
}
