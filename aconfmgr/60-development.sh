# General
AddPackage sublime-text # Sublime Text is a sophisticated text editor for code, markup and prose
AddPackage terraform # HashiCorp tool for building and updating infrastructure as code idempotently
AddPackage watchexec # Executes commands in response to file modifications
AddPackage --foreign typora # A minimal markdown editor and reader.
AddPackage --foreign jetbrains-toolbox # Manage all your JetBrains Projects and Tools
AddPackage --foreign postman-bin # Build, test, and document your APIs faster
AddPackage --foreign xxd-standalone # Hexdump utility from vim
AddPackage bind # A complete, highly portable implementation of the DNS protocol
AddPackage less # A terminal based program for viewing text files

# Docker
AddPackage docker # Pack, ship and run any application as a lightweight container
AddPackage docker-compose # Fast, isolated development environments using Docker
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service

# Build dependencies
AddPackage base-devel # Basic tools to build Arch Linux packages

# Crystal
AddPackage clang # C language family frontend for LLVM
AddPackage llvm # Compiler infrastructure
AddPackage lld # Linker from the LLVM project
AddPackage crystal # The Crystal Programming Language
AddPackage shards # The package manager for the Crystal language
AddPackage --foreign oq-bin

# Node
# AddPackage --foreign nvm

# PHP
# AddPackage php # A general-purpose scripting language that is especially suited to web development
# AddPackage composer # Dependency Manager for PHP
# AddPackage --foreign symfony-cli-bin # The Symfony client helps developers create and manage Symfony applications.

# PHP Dev
# AddPackage autoconf # A GNU tool for automatically configuring source code
# AddPackage bison # The GNU general-purpose parser generator
# AddPackage re2c # A tool for generating C-based recognizers from regular expressions

# https://github.com/the-benchmarker/web-frameworks
# AddPackage ruby
# AddPackage postgresql-libs
# AddPackage --foreign wrk

# Command to create/run DB for collecting the data
# sudo docker run --rm --name pg -d \
#     -p 5432:5432 \
#     -v $PWD/dump.sql:/docker-entrypoint-initdb.d/dump.sql \
#     -e POSTGRES_DB=benchmark \
#     -e POSTGRES_HOST_AUTH_METHOD=trust \
#     postgres:14-alpine
