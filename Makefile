.PHONY: build run

IMAGE_BASE = interrobangc
IMAGE = awscli2
MY_PWD = $(shell pwd)

all: build

build:
	docker buildx build --platform linux/amd64,linux/arm64 -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD);

push:
	docker buildx build --platform linux/amd64,linux/arm64 -t $(IMAGE_BASE)/$(IMAGE) --push -f $(MY_PWD)/Dockerfile $(MY_PWD);

shell:
	docker run -it --rm -v $(MY_PWD)/.aws:/root/.aws --name $(IMAGE_BASE)-$(IMAGE) $(IMAGE_BASE)/$(IMAGE)
