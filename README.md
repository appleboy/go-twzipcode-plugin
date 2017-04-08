# go-twzipcode-plugin

Go plugin with TWZipCode

## Installation

install `go-bindata` tool

```sh
$ go get -u github.com/jteeuwen/go-bindata/...
```

generate bind data.

```sh
$ go-bindata -pkg twzipcode -o twzipcode/twzipcode.go twzipcode/twzipcode.json
```

build plugin

```sh
$ go build -buildmode=plugin -o go-twzipcode.so go-twzipcode.go
```

## Example

[embedmd]:# (example/example.go go)
```go
package main

import (
	"log"
	"plugin"
)

func main() {
	file := "go-twzipcode.so"
	p, err := plugin.Open(file)
	if err != nil {
		log.Fatalf("%s plugin file not found. Details: %s", file, err.Error())
	}

	GetTWZipCode, err := p.Lookup("GetTWZipCode")
	if err != nil {
		log.Fatalf("GetTWZipCode function not found. Details: %s", err.Error())
	}

	getTWZipCode, ok := GetTWZipCode.(func(string, string) (string, error))
	if !ok {
		log.Fatal("Unable to cast func type")
	}

	code, _ := getTWZipCode("基隆市", "仁愛區")
	log.Println("基隆市仁愛區:", code)
	code, _ = getTWZipCode("高雄市", "苓雅區")
	log.Println("高雄市苓雅區:", code)
}
```