#!/bin/sh

# Convenience wrapper for running a playbook. For example:
# $ ./run.sh tomwadley.net.yml

ssh-agent bash -c "ssh-add && ansible-playbook -i inventory --vault-password-file ~/.ansible_vault \"$@\""
