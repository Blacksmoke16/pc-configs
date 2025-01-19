# GPU
AddPackage vulkan-validation-layers # Vulkan Validation Layers
AddPackage mesa # An open-source implementation of the OpenGL specification
AddPackage vulkan-radeon # Radeon's Vulkan mesa driver
AddPackage vulkan-mesa-layers # Mesa's Vulkan layers
AddPackage lib32-vulkan-radeon # Radeon's Vulkan mesa driver (32-bit)

# Sway & friends
AddPackage mako # Lightweight notification daemon for Wayland
AddPackage sway # Tiling Wayland compositor and replacement for the i3 window manager
AddPackage swayidle # Idle management daemon for Wayland
AddPackage swaylock # Screen locker for Wayland
AddPackage waybar # Highly customizable Wayland bar for Sway and Wlroots based compositors
AddPackage wofi # launcher for wlroots-based wayland compositors
AddPackage wlsunset # Day/night gamma adjustments for Wayland compositors

# Webcam
AddPackage xdg-desktop-portal-wlr # xdg-desktop-portal backend for wlroots
AddPackage cameractrls # Camera controls for Linux

# TODO: Remove this once https://youtrack.jetbrains.com/issue/JBR-3206 is resolved.
AddPackage xorg-xwayland # run X clients under wayland

# Themes
AddPackage breeze-gtk

# Screenshot
AddPackage slurp # Select a region in a Wayland compositor
AddPackage grim # Screenshot utility for Wayland
AddPackage wf-recorder # Screen recorder for wlroots-based compositors such as sway

# Clipboard
AddPackage --foreign clipman # A simple clipboard manager for Wayland
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland

# Core
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
SetFileProperty /etc/cups/printers.conf group root
AddPackage sane # Scanner Access Now Easy
CopyFile /etc/sane.d/net.conf
CopyFile /etc/sane.d/dll.conf
AddPackage --foreign brscan4 # SANE drivers from Brother for compatible models
AddPackage simple-scan # Simple scanning utility
SetFileProperty /etc/cups/printers.conf group ''

# sudo brsaneconfig4 -a name="color" model="mfc-j835dw" ip=192.168.1.31
CopyFile /opt/brother/scanner/brscan4/brsanenetdevice4.cfg


# Finance
AddPackage gnucash # Personal and small-business financial-accounting application
AddPackage libdbi-drivers # Database drivers for libdbi (MySQL, PostgreSQL, and SQLite)
AddPackage --foreign perl-finance-quote # Perl/CPAN Module Finance::Quote : Fetch stock prices over the Internet
CopyFile /etc/udev/rules.d/51-trezor.rules

# Media
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage pulseaudio # A featureful, general-purpose sound server
AddPackage pulseaudio-alsa # ALSA Configuration for PulseAudio
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket
CopyFile /etc/pulse/client.conf

# Gaming
AddPackage steam # Valve's digital software delivery system
AddPackage lib32-systemd # system and service manager (32-bit)
AddPackage lutris # Open Gaming Platform
AddPackage wine-staging # A compatibility layer for running Windows programs - Staging branch

# Minecraft
# AddPackage --foreign prismlauncher-qt5-bin # Minecraft launcher with ability to manage multiple instances.
# AddPackage qt5-wayland # Provides APIs for Wayland
# AddPackage jdk8-openjdk # OpenJDK Java 8 development kit (needed for E6E)
