# Tom's Provisioning/Deployment Code

These are the ansible playbooks and roles I use to provision my servers and deploy the various sites I maintain to them (such as [tomwadley.net](https://tomwadley.net/)).

The playbooks are designed to be run against **512MB Digital Ocean boxes running Ubuntu 14.04 x64**.

## Notes

This code is almost certainly not useful to anyone verbatim but if you are going to use it as a starting point for your own deployment code take note of the following:

- The inventory file contains my servers. You'll obviously need to put your own servers in instead. The DO boxes must be created manually with your public key already placed on the box by DO (i.e create a box with their web interface). You don't need to ssh to the boxes though; the `common` role takes care of box setup.
- Code to be built and deployed is sometimes pulled from my private repos.
- You are assumed to be using `ssh-agent`. There is an `ansible.cfg` that enables agent forwarding for accessing git repos.
- Ansible Vault is used for secrets such as my ssl private key. You'll need to replace these files.
- There is a Vagrant file and accompanying playbook, `local.yml`, for testing the roles locally.
- The `wordpress` role works by importing an existing WordPress installation in the form of a tar'ed WordPress directory and a MySQL dump file. It cannot create a fresh WordPress installation.

## Known Issues

- The `common` role enables automatic updates (and auto rebooting when required). I've consciously chosen to trade off uptime for convenience here. This isn't suitable for a more important production deployment where you would want to test the updates first (and have more than one instance behind a load balancer).
- I'm not using a build server. Code is checked out from git and built on the same box as its deployed to.
- A predictable variation of the MySQL root password is used for each WordPress installation and written to disk in plain text. I accept that a vulnerability anywhere could more easily expose the entire set of databases than if a unique password was used for each db.
