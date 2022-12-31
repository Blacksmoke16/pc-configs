# General
AddPackage which # A utility to show the full path of commands
AddPackage sublime-text # Sublime Text is a sophisticated text editor for code, markup and prose
AddPackage --foreign typora # A minimal markdown editor and reader.
AddPackage --foreign gitkraken # The intuitive, fast, and beautiful cross-platform Git client
AddPackage --foreign jetbrains-toolbox # Manage all your JetBrains Projects and Tools
AddPackage --foreign postman-bin # Build, test, and document your APIs faster
AddPackage --foreign xxd-standalone # Hexdump utility from vim

# Docker
AddPackage docker
AddPackage docker-compose

# Build dependencies
AddPackage pkgconf # Package compiler and linker metadata toolkit
AddPackage make # GNU make utility to maintain groups of programs
AddPackage python # Next generation of the python high-level scripting language

# Crystal
AddPackage clang # C language family frontend for LLVM
AddPackage llvm # Compiler infrastructure
AddPackage crystal # The Crystal Programming Language
AddPackage shards # The package manager for the Crystal language
AddPackage --foreign oq-bin
# AddPackage terraform

# PHP
# AddPackage php # A general-purpose scripting language that is especially suited to web development
# AddPackage composer # Dependency Manager for PHP
# AddPackage --foreign symfony-cli-bin # The Symfony client helps developers create and manage Symfony applications.

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
