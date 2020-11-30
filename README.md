# Build a Kubernetes cluster using k3s via Ansible
[![GitHub](https://img.shields.io/github/license/nicholaswilde/k3s-ansible)](./LICENSE.md)
[![CI](https://github.com/nicholaswilde/k3s-ansible/workflows/CI/badge.svg?branch=master)](https://github.com/nicholaswilde/k3s-ansible/actions?query=workflow%3ACI)
[![Ansible Lint](https://github.com/nicholaswilde/k3s-ansible/workflows/Ansible%20Lint/badge.svg?branch=master)](https://github.com/nicholaswilde/k3s-ansible/actions?query=workflow%3A%22Ansible+Lint%22)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fnicholaswilde%2Fk3s-ansible.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fnicholaswilde%2Fk3s-ansible?ref=badge_shield)

## K3s Ansible Playbook

Build a Kubernetes cluster using Ansible with k3s. The goal is easily install a Kubernetes cluster on machines running:

- [X] Debian
- [X] Ubuntu
- [X] CentOS

on processor architecture:

- [X] x64
- [X] arm64
- [X] armhf

The following extras are installed from the base k3s-ansible repository:
- [managed-nfs-storage]()
- [scp-config]()

## System requirements

Deployment environment must have Ansible 2.4.0+
Master and nodes must have passwordless SSH access

## Usage

First create a new directory based on the `sample` directory within the `inventory` directory:

```bash
cp example.hosts.yaml hosts.yaml
```

Second, edit `hosts.yaml` to match the system information gathered above.

If needed, you can also edit `group_vars/all.yml` to match your environment.

Start provisioning of the cluster using the following command:

```bash
$ make deploy
# or
$ ansible-playbook site.yml -i hosts.yaml
```

### Reset

```bash
$ make reset
# or
$ ansible-playbook reset.yml -i hosts.yaml
```

## Kubeconfig

To get access to your **Kubernetes** cluster just

```bash
$ scp pirate@master_ip:~/.kube/config ~/.kube/config
```

### Pre-commit hook

If you want to automatically lint the files with a pre-commit hook, make sure you
[install the pre-commit binary](https://pre-commit.com/#install), and add a [.pre-commit-config.yaml file](./.pre-commit-config.yaml)
to your project. Then run:

```bash
$ pre-commit install
$ pre-commit install-hooks
```

## Todo

- [ ] system-upgrade

## Author

The repository was created in 2019 by [Vincent RABAH](https://github.com/itwars) and modified by [Nicholas Wilde](https://about.me/nicholas.wilde).
