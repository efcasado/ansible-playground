###------------------------------------------------------------------------
### File: Makefile
###
###------------------------------------------------------------------------
.PHONY: all build build-sshd build-ansible up shell


## Settings
##-------------------------------------------------------------------------
NODES ?= 3


## Targets
##-------------------------------------------------------------------------
all: build

build: build-sshd build-ansible

build-sshd:
	docker build -t sshd Dockerfiles/sshd

build-ansible:
	docker build -t ansible Dockerfiles/ansible

up:
	@for i in {1..$(NODES)}; do            \
		docker run                         \
			-d                             \
			--name ansible-pg-$$i          \
			--network=ansible-pg 		   \
			--network-alias=ansible-pg-$$i \
			sshd                           \
		;                                  \
	done

down:
	@for i in {1..$(NODES)}; do      \
		docker rm -f ansible-pg-$$i; \
	done


shell:
	docker run                            \
		--rm                              \
		-it                               \
		--network=ansible-pg              \
		-v $(PWD):/opt/ansible-playground \
		-w /opt/ansible-playground        \
		ansible                           \
		bash
