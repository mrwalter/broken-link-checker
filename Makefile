IMG=broken-link-checker
REPO=mrwalter

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# See https://docs.docker.com/desktop/multi-arch/ for multi-arch support
build: ## Build the container
	    #@docker build -t $(REPO)/$(IMG):latest ./
		@docker buildx build -t $(REPO)/$(IMG):latest --platform linux/amd64,linux/arm64 --push ./

push: ## Push the latest version
	@echo 'publish latest to docker hub'
	docker push $(REPO)/$(IMG):latest
