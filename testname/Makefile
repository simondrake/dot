OS := $(shell go env GOOS)
ARCH := $(shell go env GOARCH)

build:
	GOOS=$(OS) GOARCH=$(ARCH) CGO_ENABLED=0 go build \
		-o ./testname \
		-installsuffix cgo \
		-ldflags "\
			-X main.date=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		" ./main.go

