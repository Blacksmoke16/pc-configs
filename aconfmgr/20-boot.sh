# Core packages required to boot the system to a base working state

AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage bash-completion # Programmable completion for the bash shell
AddPackage git # the fast distributed version control system
AddPackage intel-ucode # Microcode update files for Intel CPUs
AddPackage linux # The Linux kernel and modules
AddPackage linux-firmware # Firmware files for Linux
AddPackage nano # Pico editor clone with enhancements
AddPackage sudo # Give certain users the ability to run some commands as root

SetFileProperty /usr/bin/newgidmap mode ''
SetFileProperty /usr/bin/newuidmap mode ''

# filesytem
CopyFile /etc/fstab
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer

# systemd-boot
CopyFile /boot/loader/entries.srel 755 # https://systemd.io/BOOT_LOADER_SPECIFICATION/#standard-conformance-marker-file
CopyFile /boot/loader/entries/arch.conf 755
CopyFile /boot/loader/loader.conf 755
CopyFile /etc/machine-id 444
CreateLink /var/lib/dbus/machine-id /etc/machine-id
CreateDir /boot/System\ Volume\ Information
CreateDir /boot/EFI/Linux

# initramfs
CreateLink /etc/os-release ../usr/lib/os-release
