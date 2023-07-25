package repository

import (
	"fmt"
	"log"

	"github.com/hoka-isdl/MERS/backend/internal/schema"
)

func RandGetImages(images_num int) ([]schema.ListImagesInner, error) {
	var images schema.ListImagesInner
	var imagesList []schema.ListImagesInner

	rows_title, err := db.Query("SELECT id, google_drive_id FROM images ORDER BY RAND() LIMIT ?", images_num)
	if err != nil {
		log.Println(fmt.Errorf("getRows db.Query error err:%w", err))
		return nil, fmt.Errorf("getRows db.Query error err:%w", err)
	}

	for rows_title.Next() {
		err := rows_title.Scan(&images.ImageId, &images.GoogleDriveId)
		if err != nil {
			log.Println(fmt.Errorf("getRows rows.Scan error err:%w", err))
			return nil, fmt.Errorf("getRows rows.Scan error err:%w", err)
		}
		imagesList = append(imagesList, images)
	}

	return imagesList, nil
}
