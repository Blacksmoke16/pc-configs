# account management
CopyFile /etc/group
CopyFile /etc/passwd
CopyFile /etc/sudoers
SetFileProperty /etc/sudoers mode ''
SetFileProperty /usr/bin/newgidmap mode 755
SetFileProperty /usr/bin/newuidmap mode 755

# login
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service

# available shells
AddPackage foot # Fast, lightweight, and minimalistic Wayland terminal emulator
CopyFile /etc/shells
CopyFile /etc/inputrc

# Common user binaries
CopyFile /usr/local/bin/tax-calc 755
CopyFile /usr/local/bin/uuid 755
