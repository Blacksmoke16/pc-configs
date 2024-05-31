# account management
CopyFile /etc/group
CopyFile /etc/passwd
CopyFile /etc/sudoers
SetFileProperty /etc/sudoers mode ''

# login
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service

# available shells
AddPackage wezterm
CopyFile /etc/shells
CopyFile /etc/inputrc

# Utilities
AddPackage unzip # open .zip
