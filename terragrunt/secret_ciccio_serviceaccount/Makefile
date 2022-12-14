SHELL := /bin/bash
current_dir = $(shell basename ${PWD})

# HELP
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# TASKS
show-mystiko-location: ## show mystiko location for this tfstate file
	
terrastar-ultimate-formatter: ## hclfmt and fmt all files recursively
	terragrunt hclfmt -recursive terragrunt/
	terraform fmt -recursive terragrunt/

tg-run-all-first-apply: ## terragrunt run all apply for the first time, without preexistig terraform.tfstate
	terragrunt run-all apply
	../../_helper/tf_state_encrypter.sh $(current_dir)

tg-run-all-plan: ## terragrunt run all plan with secret terraform.tfstate
	../../_helper/tf_state_decrypter.sh $(current_dir)
	terragrunt run-all plan
	../../_helper/tf_state_encrypter.sh $(current_dir)

tg-run-all-output: ## terragrunt run all output with secret terraform.tfstate
	../../_helper/tf_state_decrypter.sh $(current_dir)
	terragrunt run-all plan
	../../_helper/tf_state_encrypter.sh $(current_dir)

tg-run-all-apply: ## terragrunt run all apply with secret terraform.tfstate
	../../_helper/tf_state_decrypter.sh $(current_dir)
	terragrunt run-all apply
	../../_helper/tf_state_encrypter.sh $(current_dir)

tg-run-all-destroy: ## terragrunt run all destroy with secret terraform.tfstate
	../../_helper/tf_state_decrypter.sh $(current_dir)
	terragrunt run-all apply
	../../_helper/tf_state_encrypter.sh $(current_dir)

lets_roll: ## roll_n_rotate secrets
	../../_helper/lets_roll.sh $(current_dir)
	$(info Terraform files are ready: please run make tg-run-all-plan and tg-run-all-apply to rotate and store credentials)
