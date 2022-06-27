.PHONY: configure
configure:
		ansible-playbook --ask-become-pass --inventory=ansible/inventory.yaml ansible/site.yaml
