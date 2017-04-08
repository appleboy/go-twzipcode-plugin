
.PHONY: install
install:
	go get -u github.com/jteeuwen/go-bindata/...

.PHONY: bindata
bindata:
	go-bindata -pkg twzipcode -o twzipcode/twzipcode.go twzipcode/twzipcode.json

plugin: bindata
	go build -buildmode=plugin -o go-twzipcode.so go-twzipcode.go

clean:
	rm -rf go-twzipcode.so twzipcode/twzipcode.go
