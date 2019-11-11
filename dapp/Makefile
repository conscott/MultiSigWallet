NS = cachegold
# set version if absent
TAG = $(shell scripts/make_version.sh)
VERSION ?= dev
APP_CONFIG ?= dev

REPO = multisig
NAME = multisig
PORTS = -p 5000:5000
ENV = -e MODE=docker

.PHONY: build push shell test run start stop rm lint release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

shell:
	docker run --rm --name $(NAME)-$(VERSION) -i -t $(NS)/$(REPO):$(VERSION) /bin/bash

test:
	docker run --rm $(NS)/$(REPO):$(VERSION) npm run test

integration_test: start test_all stop

run:
	docker run --rm --name $(NAME)-$(VERSION) $(PORTS) $(NS)/$(REPO):$(VERSION)

start:
	docker run -d --name $(NAME)-$(VERSION) $(PORTS) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)-$(VERSION)

rm:
	docker rm $(NAME)-$(VERSION)

rmi:
	docker rmi $(NS)/$(REPO):$(VERSION)

lint:
	docker run --rm $(NS)/$(REPO):$(VERSION) npm run lint

lint_contract:
	docker run --rm $(NS)/$(REPO):$(VERSION) npm run lint-contract

release: build
	# link tags
	docker tag $(NS)/$(REPO):$(VERSION) $(NS)/$(REPO):$(TAG)
	# tag with 'latest' before pushing
	docker tag $(NS)/$(REPO):$(VERSION) $(NS)/$(REPO):latest
	# push both tags (version and 'latest')
	docker push $(NS)/$(REPO)

default: build
