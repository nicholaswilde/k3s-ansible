#!/bin/bash

ansible-playbook site.yml && scp pirate@192.168.1.201:~/.kube/config ~/.kube/config-turing-pi
watch kubectl get all -n kube-system
