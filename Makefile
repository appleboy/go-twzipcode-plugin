
.PHONY: install
install:
	go get -u github.com/jteeuwen/go-bindata/...

.PHONY: bindata
bindata:
	go-bindata -pkg twzipcode -o twzipcode/twzipcode.go twzipcode/twzipcode.json

plugin:
	go build -buildmode=plugin -o go-twzipcode.so go-twzipcode.go
