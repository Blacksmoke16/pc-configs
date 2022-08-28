# pc-configs

Centralized location for both system (`/etc`) and dotfile (`/home`) configurations.

## Aconfmgr

[aconfmgr](https://github.com/CyberShadow/aconfmgr/) manages all _system_ level configuration.
This includes everything in `/etc`, which packges are installed, and what systemd services are enabled.

## Chezmoi

[chezmoi](https://www.chezmoi.io/) manages _user_ level configuration between various machines. 
This includes `git`, `bash`, `sway`, and everything that is specific to my local install no matter what machine I am on.
E.g. personal PC verus work Mac.

### Setup

Both tool require `git`, so be sure that's installed.

1. Clone the repo
1. Apply user configuration `TODO`
1. Apply system configuration `aconfmgr apply`
