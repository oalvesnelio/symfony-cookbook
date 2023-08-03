SHELL := /bin/bash
export

export HOST_UID:=$(shell id --user)
export HOST_USER:=$(shell id --user --name)
export HOST_GID:=$(shell id --group)
export HOST_GROUP:=$(shell id --group --name)

COLOR_RESET := $(shell tput sgr0)
COLOR_ITEM := $(shell tput setaf 2)
COLOR_VAL := $(shell tput setaf 4)
COLOR_SESSION := $(shell tput setaf 208)
COLOR_DEFAULT_VAL := $(shell tput setaf 130)

CMAKE := $(MAKE) --no-print-directory
SPACE_CHAR=$(subst ,, )

# General targets:
.PHONY: help up down open-local logs

help:	
	@echo '${COLOR_SESSION}Getting started to use the application:${COLOR_RESET}'
	@echo '  ${COLOR_ITEM}Restore:${COLOR_RESET} the production database'
	@echo '  ${COLOR_ITEM}  Go to:${COLOR_RESET} the main branch'
	@echo '  ${COLOR_ITEM}Execute:${COLOR_RESET} make deploy'
	@echo ''
	@echo '${COLOR_SESSION}Getting started to develop:${COLOR_RESET}'
	@echo '  ${COLOR_ITEM}Restore:${COLOR_RESET} the production database'
	@echo '  ${COLOR_ITEM}  Go to:${COLOR_RESET} the issue branch'
	@echo '  ${COLOR_ITEM}Execute:${COLOR_RESET} make deploy'
	@echo '  ${COLOR_ITEM}Execute:${COLOR_RESET} make datafixture'
	@echo '  ${COLOR_ITEM}Execute:${COLOR_RESET} make test'
	@echo ''	
	@echo '${COLOR_SESSION}Using the targets:${COLOR_RESET}'
	@echo '  make TARGET [OPTIONS]'
	@echo ''
	@echo '${COLOR_SESSION}General targets:${COLOR_RESET}'
	@echo '  ${COLOR_ITEM}help${COLOR_RESET}                   Display this help message'
	@echo ''
	@echo '${COLOR_SESSION}Variables:${COLOR_RESET}'
	@echo '  ${COLOR_ITEM}user${COLOR_RESET}                   $(HOST_USER)(uid=$(HOST_UID))'
	@echo '  ${COLOR_ITEM}group${COLOR_RESET}                  $(HOST_GROUP)(gid=$(HOST_GID))'
	@echo ''	
	@echo "  up-symfony                     Starts symfony service's"
	@echo ''	

up:
	symfony server:start -d
	
down:
	symfony server:stop

open-local:
	symfony open:local

logs:
	symfony server:log