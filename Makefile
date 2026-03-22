##Usage: make <command>
##
##Commands:
IMAGE_NAME := $(shell grep "ARG NAME" ./Dockerfile | cut -d'"' -f2)
CONTAINER_NAME := $(shell grep "ARG NAME" ./Dockerfile | cut -d'"' -f2 | sed 's/\//-/g')
IMAGE_VERSION := $(shell grep "ARG VERSION" ./Dockerfile | cut -d'"' -f2)
PORT_DEV = 8080

.PHONY: build serve help

default: help

build:			## Build docker image
	@echo "Build $(IMAGE_NAME) v$(IMAGE_VERSION)..."
	@docker build -t "$(IMAGE_NAME)" ./
	@docker tag "$(IMAGE_NAME)" "$(IMAGE_NAME):$(IMAGE_VERSION)"
	@echo "Create image $(IMAGE_NAME):$(IMAGE_VERSION) done."
	@docker image ls "${IMAGE_NAME}"

serve:			## Start docker image locally
	@echo "Start httpd locally: http://localhost:$(PORT_DEV)/"
	@(sleep 2; open "http://localhost:$(PORT_DEV)/") &
	@docker run -it --rm --hostname "${CONTAINER_NAME}" -p $(PORT_DEV):80 --name "$(CONTAINER_NAME)" "$(IMAGE_NAME)"

shell:			## Open shell into the running container
	@docker exec -it "$(CONTAINER_NAME)" /bin/sh

help:			## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
