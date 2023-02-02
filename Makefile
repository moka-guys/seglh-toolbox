IMAGE=seglh/toolbox

.PHONY: all build

all: toolbox.tar.gz

push: build
	docker push $(IMAGE)

build:
	docker build -t $(IMAGE) .

toolbox.tar.gz: build
	docker save $(IMAGE) | gzip > $@
