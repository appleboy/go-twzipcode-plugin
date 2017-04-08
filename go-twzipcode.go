package main

import (
	"encoding/json"

	"github.com/appleboy/go-twzipcode-plugin/twzipcode"
)

func initDB() ([]byte, error) {
	data, err := twzipcode.Asset("twzipcode/twzipcode.json")
	if err != nil {
		return nil, err
	}

	return data, nil
}

// GetTWZipCode get Taiwan zip code (3 number)
func GetTWZipCode(city string, area string) (string, error) {
	var dat map[string]map[string]string

	data, err := initDB()
	if err != nil {
		return "", err
	}

	if err := json.Unmarshal(data, &dat); err != nil {
		return "", err
	}

	return dat[city][area], nil
}
