# set time
CopyFile /etc/adjtime

# set locale
CreateLink /etc/localtime /usr/share/zoneinfo/America/New_York
CopyFile /etc/locale.gen
CopyFile /etc/locale.conf

# dns
CopyFile /etc/hostname
CopyFile /etc/hosts

# pacman
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist
CreateFile /var/lib/systemd/timers/stamp-archlinux-keyring-wkd-sync.timer > /dev/null
AddPackage reflector # A Python 3 module and script to retrieve and filter the latest Pacman mirror list.

#
# Add primary packages that are needed no matter what DE/WM are being used
#

# config managers
AddPackage --foreign aconfmgr-git
AddPackage chezmoi

AddPackage fakeroot # Required by yay

AddPackage noto-fonts # Google Noto TTF fonts
AddPackage --foreign noto-fonts-sc # Noto CJK-SC fonts for Simplified Chinese
AddPackage noto-fonts-emoji # Google Noto emoji fonts
AddPackage ttf-roboto-mono # A monospaced addition to the Roboto type family.

AddPackage openssh # Premier connectivity tool for remote login with the SSH protocol
AddPackage gnupg # Complete and free implementation of the OpenPGP standard
AddPackage neofetch # A CLI system information tool written in BASH that supports displaying images.
AddPackage bashtop # Linux resource monitor
AddPackage lf # A terminal file manager inspired by ranger
AddPackage fzf # Command-line fuzzy finder
AddPackage trash-cli # Command line trashcan (recycle bin) interface
AddPackage diff-so-fancy # Good-looking diffs with diff-highlight and more

# Setups GPG
CreateLink /etc/systemd/user/sockets.target.wants/dirmngr.socket /usr/lib/systemd/user/dirmngr.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-browser.socket /usr/lib/systemd/user/gpg-agent-browser.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-extra.socket /usr/lib/systemd/user/gpg-agent-extra.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-ssh.socket /usr/lib/systemd/user/gpg-agent-ssh.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent.socket /usr/lib/systemd/user/gpg-agent.socket

# systemd
CreateDir /var/lib/systemd/linger
CreateDir /var/lib/systemd/pstore
CreateDir /var/lib/machines 700
CreateDir /var/lib/portables 700
CreateDir /var/lib/private 700
CreateFile /var/lib/systemd/timers/stamp-fstrim.timer > /dev/null
CreateFile /var/lib/systemd/timers/stamp-shadow.timer > /dev/null
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket

# enable systemd-timesyncd
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateFile /var/lib/systemd/timesync/clock '' systemd-timesync systemd-timesync > /dev/null
SetFileProperty /var/lib/systemd/timesync group systemd-timesync
SetFileProperty /var/lib/systemd/timesync owner systemd-timesync

# enable systemd-networkd
CreateLink /etc/systemd/system/dbus-org.freedesktop.network1.service /usr/lib/systemd/system/systemd-networkd.service
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-networkd.service /usr/lib/systemd/system/systemd-networkd.service
CreateLink /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service /usr/lib/systemd/system/systemd-networkd-wait-online.service
CreateLink /etc/systemd/system/sockets.target.wants/systemd-networkd.socket /usr/lib/systemd/system/systemd-networkd.socket
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-network-generator.service /usr/lib/systemd/system/systemd-network-generator.service

# enable systemd-resolved
CreateLink /etc/systemd/system/dbus-org.freedesktop.resolve1.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-resolved.service /usr/lib/systemd/system/systemd-resolved.service

# enable wired networking
CopyFile /etc/systemd/network/20-wired.network
