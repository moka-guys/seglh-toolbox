# Define image names
APP      := bcftools_v1.15.1
DOCKERFILE := bcftools_v1.15.1.dockerfile
# command to pull out the image ID from the newly built app
IMG_ID := $(shell docker image ls -f reference='$(APP)*' --format {{.ID}})
build:
	docker build -t $(APP) - < $(DOCKERFILE) 
	docker save $(APP) | gzip > $(APP):$(IMG_ID).tar.gz
	
