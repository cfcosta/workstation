ifeq (shell,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: build
build:
	docker build -t workstation_base:latest --build-arg USER=$(shell whoami) ./deploy/base
	docker build -t workstation_js:latest ./deploy/js
	docker build -t workstation_rust:latest ./deploy/rust
