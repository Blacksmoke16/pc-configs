# GPU
AddPackage nvidia # NVIDIA drivers for linux
AddPackage lib32-nvidia-utils # NVIDIA drivers utilities (32-bit)
AddPackage vulkan-validation-layers # Vulkan Validation Layers
CopyFile /etc/pacman.d/hooks/nvidia.hook
CreateLink /etc/systemd/system/systemd-hibernate.service.wants/nvidia-resume.service /usr/lib/systemd/system/nvidia-resume.service
CreateLink /etc/systemd/system/systemd-suspend.service.wants/nvidia-resume.service /usr/lib/systemd/system/nvidia-resume.service

# Sway & friends
AddPackage mako # Lightweight notification daemon for Wayland
AddPackage sway # Tiling Wayland compositor and replacement for the i3 window manager
AddPackage swayidle # Idle management daemon for Wayland
AddPackage waybar # Highly customizable Wayland bar for Sway and Wlroots based compositors
AddPackage wofi # launcher for wlroots-based wayland compositors

# Themes
AddPackage breeze-gtk

# Screenshot
AddPackage slurp # Select a region in a Wayland compositor
AddPackage grim # Screenshot utility for Wayland

# Clipboard
AddPackage --foreign clipman # A simple clipboard manager for Wayland
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland

# Core
AddPackage --foreign armcord-bin # Discord client for lower end and ARM devices.
AddPackage --foreign google-chrome # The popular and trusted web browser by Google (Stable Channel)

# Printing
AddPackage cups # The CUPS Printing System - daemon package
AddPackage --foreign brother-mfc-j885dw # LPR and CUPS driver for the Brother MFC-J885DW printer
CreateLink /etc/systemd/system/sockets.target.wants/cups.socket /usr/lib/systemd/system/cups.socket
CopyFile /etc/cups/ppd/color.ppd 640 '' cups
function PrinterConfFilter() {
    sed 's/Attribute marker-change-time .*/Attribute marker-change-time 1663713996/' | \
        sed 's/StateTime .*/StateTime 1663713996/' | \
        sed 's/Attribute marker-levels .*/Attribute marker-levels -1,-1,-1,-1,-1/'
}
AddFileContentFilter '/etc/cups/printers.conf' PrinterConfFilter
CopyFile /etc/cups/printers.conf 600
AddPackage sane # Scanner Access Now Easy
CopyFile /etc/sane.d/net.conf
CopyFile /etc/sane.d/dll.conf
AddPackage --foreign brscan4 # SANE drivers from Brother for compatible models
# sudo brsaneconfig4 -a name="color" model="mfc-j835dw" ip=192.168.1.31
CopyFile /opt/brother/scanner/brscan4/brsanenetdevice4.cfg
AddPackage simple-scan # Simple scanning utility

# Gnucash
AddPackage gnucash # Personal and small-business financial-accounting application
AddPackage libdbi-drivers # Database drivers for libdbi (MySQL, PostgreSQL, and SQLite)
AddPackage perl-date-manip # Date::Manip - date manipulation routines
AddPackage perl-finance-quote # Perl/CPAN Module Finance::Quote : Fetch stock prices over the Internet
AddPackage perl-readonly # Companion module for Readonly.pm, to speed up read-only
AddPackage --foreign perl-web-scraper # Web Scraping Toolkit using HTML and CSS Selectors or XPath expressions
AddPackage --foreign perl-spreadsheet-xlsx # Perl extension for reading MS Excel 2007 files
AddPackage --foreign perl-html-tokeparser-simple # Easy to use HTML::TokeParser interface

# Media
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage pulseaudio # A featureful, general-purpose sound server
AddPackage pulseaudio-alsa # ALSA Configuration for PulseAudio
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket

# Gaming
AddPackage steam # Valve's digital software delivery system
AddPackage lib32-systemd # system and service manager (32-bit)

# Minecraft
AddPackage --foreign prismlauncher-qt5-bin # Minecraft launcher with ability to manage multiple instances.
AddPackage --foreign glfw-wayland-minecraft # A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)
