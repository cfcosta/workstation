ifeq (shell,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: build
build:
	docker build -t workstation_base:latest --build-arg USER=$(shell whoami) ./deploy/base
	docker build -t workstation_js:latest --build-arg USER=$(shell whoami) ./deploy/js
	docker build -t workstation_rust:latest --build-arg USER=$(shell whoami) ./deploy/rust
	docker build -t workstation_postgresql:latest --build-arg USER=$(shell whoami) ./deploy/postgresql
