.PHONY: build run

IMAGE_BASE = interrobangc
IMAGE = awscli
MY_PWD = $(shell pwd)

all: build

build:
	docker build -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD);

push:
	docker build -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD);

shell:
	docker run -it --rm -v $(MY_PWD)/.aws:/root/.aws --name $(IMAGE_BASE)-$(IMAGE) $(IMAGE_BASE)/$(IMAGE)
