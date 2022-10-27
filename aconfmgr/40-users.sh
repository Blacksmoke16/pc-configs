# account management
CopyFile /etc/group
CopyFile /etc/passwd
CopyFile /etc/sudoers
SetFileProperty /etc/sudoers mode ''

# login
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service

# available shells
AddPackage foot # Fast, lightweight, and minimalistic Wayland terminal emulator
CopyFile /etc/shells
CopyFile /etc/inputrc

# Utilities
AddPackage unzip # open .zip

# Common user binaries
CopyFile /usr/local/bin/tax-calc 755
CopyFile /usr/local/bin/uuid 755
