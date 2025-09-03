start:
	docker run -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

build:
	docker run -it -v ${PWD}:/docs squidfunk/mkdocs-material build

