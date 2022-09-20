# user
IgnorePath '/etc/.pwd.lock'
IgnorePath '/etc/passwd-'
IgnorePath '/etc/group-'
IgnorePath '/etc/shadow*'
IgnorePath '/etc/gshadow*'
IgnorePath '/var/db/sudo/lectured/*'

# udev
IgnorePath '/etc/udev/hwdb.bin'
IgnorePath '/usr/lib/udev/hwdb.bin'

# systemd
IgnorePath '/var/lib/systemd/catalog/database'
IgnorePath '/var/lib/systemd/random-seed'
IgnorePath '/var/lib/systemd/coredump*'
IgnorePath '/var/tmp/systemd-private-*'

# systemd-boot
IgnorePath '/boot/EFI/Microsoft/*' # This can be manually setup if needed
IgnorePath '/boot/EFI/BOOT/BOOTX64.EFI'
IgnorePath '/boot/EFI/systemd/systemd-bootx64.efi'
IgnorePath '/boot/initramfs*.img'
IgnorePath '/boot/loader/random-seed'
IgnorePath '/boot/vmlinuz-linux'
IgnorePath '/etc/mkinitcpio.d/linux.preset'

# systemd logs
IgnorePath '/var/log/*'

# systemd-update-done.service
IgnorePath '/etc/.updated'
IgnorePath '/var/.updated'

# random
IgnorePath '/lost+found'
IgnorePath '/etc/sgml/*'
IgnorePath '/etc/resolv.conf'

# yay
IgnorePackage --foreign yay-bin

# ld
IgnorePath '/etc/ld.so.cache'

# info
IgnorePath '/usr/share/info/*'

# locale
IgnorePath '/usr/lib/locale/locale-archive'

# GTK
IgnorePath '/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache'
IgnorePath '/usr/lib/gtk-3.0/3.0.0/immodules.cache'
IgnorePath '/usr/lib/gio/modules/giomodule.cache'

# certificates
IgnorePath '/etc/ca-certificates/extracted'
IgnorePath '/etc/ssl/certs'

# pacman
IgnorePath '/etc/pacman.d/gnupg'
IgnorePath '/var/lib/pacman/local/*'
IgnorePath '/var/lib/pacman/sync/*'
IgnorePath '/var/lib/tpm2-tss/system/keystore'

# mime
IgnorePath '/usr/share/applications/mimeinfo.cache'
IgnorePath '/usr/share/mime/*.xml' # Localizations
IgnorePath '/usr/share/mime/XMLnamespaces'
IgnorePath '/usr/share/mime/aliases' # MIME aliases
IgnorePath '/usr/share/mime/generic-icons'
IgnorePath '/usr/share/mime/globs' # File extensions
IgnorePath '/usr/share/mime/globs2' # Weighted file extensions?
IgnorePath '/usr/share/mime/icons'
IgnorePath '/usr/share/mime/magic' # Binary magic database
IgnorePath '/usr/share/mime/mime.cache' # Binary
IgnorePath '/usr/share/mime/subclasses'
IgnorePath '/usr/share/mime/treemagic' # Directory magic
IgnorePath '/usr/share/mime/types'
IgnorePath '/usr/share/mime/version'

# fonts
IgnorePath '/etc/fonts/conf.d/*'
IgnorePath '/usr/share/fonts/*'
IgnorePath '/usr/share/glib-2.0/schemas/gschemas.compiled'

# icons
IgnorePath '/usr/share/icons/*/icon-theme.cache'

# kernel
IgnorePath '/usr/lib/modules/*-arch*'

# Docker
IgnorePath '/etc/docker/key.json' # https://stackoverflow.com/questions/47573820/what-is-etc-docker-key-json
IgnorePath '/opt/containerd/*'
IgnorePath '/var/lib/docker/*'

# Java
IgnorePath '/usr/lib/jvm/*'

# Printing
IgnorePath '/etc/printcap' # This file is automatically generated by cupsd.
IgnorePath '/etc/cups/subscriptions.conf' # Urg, https://github.com/apple/cups/issues/5313
IgnorePath '/etc/cups/classes.conf' # https://www.cups.org/doc/man-classes.conf.html
IgnorePath '/etc/cups/printers.conf.O' # https://askubuntu.com/a/1106572
IgnorePath '/etc/cups/ppd/color.ppd.O' # https://askubuntu.com/a/1106572
IgnorePath '/var/spool/*'
