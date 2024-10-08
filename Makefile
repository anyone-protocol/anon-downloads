.PHONY: help
help: # Display this help
	@awk 'BEGIN{FS=":.*#";printf "Usage:\n  make <target>\n\nTargets:\n"}/^[a-zA-Z_-]+:.*?#/{printf"  %-10s %s\n",$$1,$$2}' $(MAKEFILE_LIST)

.PHONY: build
build: # Build service to bin/ directory
	go build -o bin/service cmd/service/main.go

.PHONY: run
run: build # Runs service after build
	./bin/service
