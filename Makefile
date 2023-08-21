all: build tag push

NAME=gradioapp
VERSION=v2
REGISTRY="quay.io/rcarrata"
TOOL="docker"

build: 
	@${TOOL} build -t localhost/${NAME}:${VERSION} .
	
tag:
	@${TOOL} tag localhost/${NAME}:${VERSION} ${REGISTRY}/${NAME}:${VERSION}

push: 
	@${TOOL} push ${REGISTRY}/${NAME}:${VERSION}