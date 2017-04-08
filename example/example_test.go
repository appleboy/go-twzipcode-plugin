package example

import (
	"plugin"
	"testing"
)

func TestPlugin(t *testing.T) {
	file := "./../go-twzipcode.so"
	p, err := plugin.Open(file)
	if err != nil {
		t.Fatalf("%s plugin file not found. Details: %s", file, err.Error())
	}

	GetTWZipCode, err := p.Lookup("GetTWZipCode")
	if err != nil {
		t.Fatalf("GetTWZipCode function not found. Details: %s", err.Error())
	}

	getTWZipCode, ok := GetTWZipCode.(func(string, string) (string, error))
	if !ok {
		t.Fatal("Unable to cast func type")
	}

	code, err := getTWZipCode("基隆市", "仁愛區")
	if code != "200" {
		t.Fatalf("Expected 200, got %s", code)
	}
	if err != nil {
		t.Fatalf("Get Code Error %s", err.Error())
	}
}
