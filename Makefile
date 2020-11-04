.PHONY: build run

IMAGE_BASE = interrobangc
IMAGE = awscli
MY_PWD = $(shell pwd)

all: build

build:
ifdef NOCACHE
	docker build --no-cache -t $(IMAGE_BASE)/$(IMAGE) .
else
	docker build -t $(IMAGE_BASE)/$(IMAGE) .
endif

push:
	docker push $(IMAGE_BASE)/$(IMAGE)

run:
	docker run -it --rm -v $(MY_PWD)/.aws:/root/.aws --name $(IMAGE_BASE)-$(IMAGE) $(IMAGE_BASE)/$(IMAGE)
