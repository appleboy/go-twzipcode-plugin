.PHONY: bindata
bindata:
	@hash go-bindata > /dev/null 2>&1; if [ $$? -ne 0 ]; then \
		go get -u github.com/jteeuwen/go-bindata/...; \
	fi
	go-bindata -pkg twzipcode -o twzipcode/twzipcode.go twzipcode/twzipcode.json

.PHONY: plugin
plugin: bindata
	go build -buildmode=plugin -o go-twzipcode.so go-twzipcode.go

embedmd:
	@hash embedmd > /dev/null 2>&1; if [ $$? -ne 0 ]; then \
		go get -u github.com/campoy/embedmd; \
	fi
	embedmd -d *.md

.PHONY: test
test:
	go test -v ./test/...

clean:
	rm -rf go-twzipcode.so twzipcode/twzipcode.go
