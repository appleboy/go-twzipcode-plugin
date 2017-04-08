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