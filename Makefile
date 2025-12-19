#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ---------------------------------------------
	@echo build
	@echo init / plan / apply / show / output / destroy
	@echo taint
	@echo ---------------------------------------------
	@echo workspace
	@echo ssh / ssh-root
	@echo clean
	@echo nuke-apply
	@echo reset-terraform
	@echo ---------------------------------------------

_header:
	@echo --------------------
	@echo Docker en OpenNebula
	@echo --------------------

build:
	@docker compose build --pull

init:
	@docker compose run --rm terraform-ansible terraform -chdir=/terraform init -upgrade

plan:
	@docker compose run --rm terraform-ansible terraform -chdir=/terraform plan

apply:
	@docker compose run --rm terraform-ansible time -f "Tiempo total: %E" terraform -chdir=/terraform apply -auto-approve

show:
	@docker compose run --rm terraform-ansible terraform -chdir=/terraform show

output:
	@docker compose run --rm terraform-ansible terraform -chdir=/terraform output

destroy:
	@docker compose run --rm terraform-ansible time -f "Tiempo total: %E" terraform -chdir=/terraform destroy -auto-approve

taint:
	@docker compose run --rm terraform-ansible terraform -chdir=/terraform taint terraform_data.ansible_master

workspace:
	@docker compose run --rm terraform-ansible /bin/sh

ssh:
	@docker compose run --rm terraform-ansible run_ssh.sh debian

ssh-root:
	@docker compose run --rm terraform-ansible run_ssh.sh

clean:
	@docker compose down -v --remove-orphans

nuke-apply: clean build init destroy apply

reset-terraform:
	@docker compose run --rm terraform-ansible reset_terraform.sh
