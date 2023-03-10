# Define image names
APP      := bcftools_v1.15.1
REGISTRY := seglh
DOCKERFILE := bcftools_v1.15.1.dockerfile
# command to pull out the image ID from the newly built app
IMG_ID := $(shell docker image ls -f reference='$(APP)*' --format {{.ID}})
build:
	docker build -t $(REGISTRY)/$(APP) - < $(DOCKERFILE) 
	docker save $(REGISTRY)/$(APP) | gzip > $(REGISTRY)-$(APP):$(IMG_ID).tar.gz
	
