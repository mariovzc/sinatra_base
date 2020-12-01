PACKAGE_NAME=ruby_sinatra
HOST_PORT=8000
PROJECT_FOLDER=.
GIT_DIR=$(shell pwd)

build: 
	docker build -t $(PACKAGE_NAME) -f Dockerfile.dev  --build-arg package_name=$(PACKAGE_NAME) $(GIT_DIR)

shell:
	docker run -it --rm -v $(GIT_DIR):/app -p $(HOST_PORT):8000 -w /app/$(PROJECT_FOLDER) --entrypoint=/bin/sh $(PACKAGE_NAME)

run:
	docker run -it --rm -v $(GIT_DIR):/app -p $(HOST_PORT):8000 $(PACKAGE_NAME)