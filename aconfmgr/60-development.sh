# General
AddPackage just # A handy way to save and run project-specific commands
AddPackage terraform # HashiCorp tool for building and updating infrastructure as code idempotently
AddPackage watchexec # Executes commands in response to file modifications
AddPackage --foreign jetbrains-toolbox # Manage all your JetBrains Projects and Tools
AddPackage --foreign postman-bin # Build, test, and document your APIs faster
AddPackage --foreign xxd-standalone # Hexdump utility from vim
AddPackage bind # A complete, highly portable implementation of the DNS protocol
AddPackage less # A terminal based program for viewing text files
AddPackage rsync # A fast and versatile file copying tool for remote and local files (required for zed auto-update)
AddPackage --foreign shellcheck-bin # Shell script analysis tool (binary release, static)

# Docker
AddPackage docker # Pack, ship and run any application as a lightweight container
AddPackage docker-compose # Fast, isolated development environments using Docker
AddPackage docker-buildx # Docker CLI plugin for extended build capabilities with BuildKit
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service

# Build dependencies
AddPackage base-devel # Basic tools to build Arch Linux packages

# Crystal
AddPackage clang # C language family frontend for LLVM
AddPackage llvm # Compiler infrastructure
AddPackage lld # Linker from the LLVM project
AddPackage crystal # The Crystal Programming Language
AddPackage shards # The package manager for the Crystal language
AddPackage kcov # Code coverage tester for compiled programs, Python scripts and shell scripts
AddPackage --foreign oq-bin

# Node
AddPackage nvm

# PHP
# AddPackage php # A general-purpose scripting language that is especially suited to web development
# AddPackage composer # Dependency Manager for PHP
# AddPackage --foreign symfony-cli-bin # The Symfony client helps developers create and manage Symfony applications.

# PHP Dev
# AddPackage autoconf # A GNU tool for automatically configuring source code
# AddPackage bison # The GNU general-purpose parser generator
# AddPackage re2c # A tool for generating C-based recognizers from regular expressions
