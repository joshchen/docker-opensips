NAME ?= my-opensips
OPENSIPS_VERSION ?= 3.1
OPENSIPS_BUILD ?= releases
OPENSIPS_DOCKER_TAG ?= latest
OPENSIPS_CLI ?= true
OPENSIPS_EXTRA_MODULES ?= opensips-mysql-module
OPENSIPS_EX_PORT ?= 5060

all: build start

.PHONY: build start
build:
	docker build \
		--build-arg=OPENSIPS_BUILD=$(OPENSIPS_BUILD) \
		--build-arg=OPENSIPS_VERSION=$(OPENSIPS_VERSION) \
		--build-arg=OPENSIPS_CLI=${OPENSIPS_CLI} \
		--build-arg=OPENSIPS_EXTRA_MODULES="${OPENSIPS_EXTRA_MODULES}" \
		--tag="my-opensips/my-opensips:$(OPENSIPS_DOCKER_TAG)" \
		.
start:
	docker run -p $(OPENSIPS_EX_PORT):5060/udp -d --name $(NAME) my-opensips/my-opensips:$(OPENSIPS_DOCKER_TAG)

stop:
	docker stop $(NAME)

resume:
	docker start $(NAME)

remove:
	docker rm $(NAME)

shell:
	docker exec -it $(NAME) /bin/bash

logs:
	docker logs ${NAME} -f
