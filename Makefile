NS ?= ghcr.io/janpreet
VERSION ?= latest

IMAGE_NAME ?= docker-latex
CONTAINER_NAME ?= resume
CONTAINER_INSTANCE ?= default

PWD ?= ${PWD}

.PHONY: build run run-pdf run-doc run-md stop rmi clean

build: Dockerfile
	docker build -t $(NS)/$(IMAGE_NAME):$(VERSION) -f Dockerfile .

run-pdf:
	docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) -i -v $(PWD):/data $(NS)/$(IMAGE_NAME):$(VERSION) pdflatex janpreet-singh-resume.tex
	rm -f *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 .*.lb

run-rtf:
	docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) -v $(PWD):/data $(NS)/$(IMAGE_NAME):$(VERSION) latex2rtf janpreet-singh-resume.tex

run: run-pdf run-doc

stop:
	docker stop $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

rmi:
	docker rmi $(NS)/$(IMAGE_NAME):$(VERSION)

clean:
	rm -f *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 .*.lb

default: run
