include make_env

MASTER_IP ?= 192.168.1.192
MASTER_USER ?= pirate

.PHONY: copy-config redeploy

## deploy		: Deploy the k3s-cluster
deploy: site.yml
	ansible-playbook site.yml

## copy-config	: Copy the config over
copy-config: ~/.kube/config-turing-pi
	scp ${MASTER_USER}@${MASTER_IP}:~/.kube/config ~/.kube/config-turing-pi

## redeploy	: Reset and the deploy the k3s-cluster
redeploy:
	ansible-playbook reset.yml && \
	ansible-playbook site.yml

## reset		: Reset the k3s-cluster
reset: reset.yml
	ansible-playbook reset.yml

## requirements	: Install the requirements
#git remote add upstream https://github.com/rancher/k3s-ansible.git && \
requirements:	requirements.yaml
	ansible-galaxy role install -r requirements.yaml --force && \
	ansible-galaxy collection install -r requirements.yaml --force

## sync		: Sync from the upstream repository
sync:
	git fetch upstream && \
	git checkout master && \
	git merge upstream/master

## help		: Show help
help: Makefile
	@sed -n 's/^##//p' $<

default: deploy
