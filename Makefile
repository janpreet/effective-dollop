NS ?= janpreet
VERSION ?= latest

IMAGE_NAME ?= latex
CONTAINER_NAME ?= resume
CONTAINER_INSTANCE ?= default

PWD ?= ${PWD}

.PHONY: build run stop rmi

build: Dockerfile
	docker build -t $(NS)/$(IMAGE_NAME):$(VERSION) -f Dockerfile .

run:
	docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) -i -v $(PWD):/data $(NS)/$(IMAGE_NAME):$(VERSION) pdflatex janpreet-singh-resume.tex
	rm -f *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 .*.lb

stop:
	docker stop $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

rmi:
	docker rmi $(NS)/$(IMAGE_NAME):$(VERSION)

default: run