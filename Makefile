all: build tag push

NAME=gradioapp
VERSION=v4
REGISTRY="quay.io/rcarrata"
TOOL="docker"

build: 
	@${TOOL} build -t localhost/${NAME}:${VERSION} .
	
tag:
	@${TOOL} tag localhost/${NAME}:${VERSION} ${REGISTRY}/${NAME}:${VERSION}

push: 
	@${TOOL} push ${REGISTRY}/${NAME}:${VERSION}

run:
	@${TOOL} run -d -p 7860:7860 ${REGISTRY}/${NAME}:${VERSION}