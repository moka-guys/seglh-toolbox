COMMIT := $(shell git log --pretty=format:'%h' -n 1)
BUILD := v1.15.1_$(COMMIT)
DIR := $(shell pwd)

# Define image names
APP      := bcl2fastq2
REGISTRY := seglh

# Build tags
IMG           := $(REGISTRY)/$(APP)
IMG_VERSIONED := $(IMG):$(BUILD)
IMG_LATEST    := $(IMG):latest

.PHONY: push build version cleanbuild

push: build
	docker push $(IMG_VERSIONED)
	docker push $(IMG_LATEST)

build: version
	docker buildx build --platform linux/amd64 -t $(IMG_VERSIONED) . || docker build -t $(IMG_VERSIONED) .
	docker tag $(IMG_VERSIONED) $(IMG_LATEST)
	docker save $(IMG_VERSIONED) | gzip > $(DIR)/$(REGISTRY)-$(APP):$(BUILD).tar.gz

cleanbuild:
	docker buildx build --platform linux/amd64 --no-cache -t $(IMG_VERSIONED) .