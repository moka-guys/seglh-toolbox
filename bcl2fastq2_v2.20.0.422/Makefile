# Extract current commit hash
COMMIT := $(shell git log --pretty=format:'%h' -n 1)
# Version and commit hash of the build
BUILD := v2.20.0.422_$(COMMIT)
DIR := $(shell pwd)

# Define image names
APP      := bcl2fastq2
REGISTRY := seglh

# Build tags
REPOSITORY	  := $(REGISTRY)/$(APP)
IMG_VERSIONED := $(REPOSITORY):$(BUILD)
IMG_LATEST    := $(REPOSITORY):latest

.PHONY: push build version cleanbuild

push: build
	docker push $(IMG_VERSIONED)
	docker push $(IMG_LATEST)

build:
	docker buildx build --platform linux/amd64 -t $(IMG_VERSIONED) . || docker build -t $(IMG_VERSIONED) .
	docker tag $(IMG_VERSIONED) $(IMG_LATEST)
	$(eval IMAGE_ID := $(shell sudo docker image ls -f reference='$(IMG_VERSIONED)' -q))
	docker save $(IMG_VERSIONED) | gzip > $(DIR)/$(REGISTRY)-$(APP):$(BUILD)-$(IMAGE_ID).tar.gz

cleanbuild:
	docker buildx build --platform linux/amd64 --no-cache -t $(IMG_VERSIONED) .
	docker tag $(IMG_VERSIONED) $(IMG_LATEST)
	$(eval IMAGE_ID := $(shell sudo docker image ls -f reference='$(IMG_VERSIONED)' -q))
	docker save $(IMG_VERSIONED) | gzip > $(DIR)/$(REGISTRY)-$(APP):$(BUILD)-$(IMAGE_ID).tar.gz
