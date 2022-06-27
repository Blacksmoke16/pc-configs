# pc-configs

Provides automation for setting up a new Linux PC install.

## Archiso

TODO

## Ansible

[Ansible](https://www.ansible.com/) is the core tool used to configure the machine once we have things bootable.

### Setup

Ansible requires python (ew) to run, so first ensure it, and `pip` are installed:

```sh
yay -S ansible python-pip
```

Then from here we can kick off the job

```sh
make configure
```

TIP: Add `-D` to show diffs or `-C` for a dry run.
