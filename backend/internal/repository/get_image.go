package repository

import (
	"fmt"

	"github.com/ISDL-dev/MERS/backend/internal/schema"
)

func RandGetImages(numImages int) ([]schema.ListImagesInner, error) {
	var image schema.ListImagesInner
	var imagesList []schema.ListImagesInner

	rows_title, err := db.Query("SELECT id, google_drive_id FROM images ORDER BY RAND() LIMIT ?", numImages)
	if err != nil {
		return nil, fmt.Errorf("getRows db.Query error err:%w", err)
	}

	for rows_title.Next() {
		err := rows_title.Scan(&image.ImageId, &image.GoogleDriveId)
		if err != nil {
			return nil, fmt.Errorf("getRows rows_title.Scan error err:%w", err)
		}
		imagesList = append(imagesList, image)
	}

	return imagesList, nil
}
