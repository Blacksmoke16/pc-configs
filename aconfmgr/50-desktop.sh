# Sway & friends
AddPackage mako # Lightweight notification daemon for Wayland
AddPackage sway # Tiling Wayland compositor and replacement for the i3 window manager
AddPackage swayidle # Idle management daemon for Wayland
AddPackage waybar # Highly customizable Wayland bar for Sway and Wlroots based compositors
AddPackage wofi # launcher for wlroots-based wayland compositors
AddPackage xorg-xwayland # run X clients under wayland

# Themes
AddPackage breeze-gtk

# Screenshot
AddPackage slurp # Select a region in a Wayland compositor
AddPackage grim # Screenshot utility for Wayland

# Clipboard
AddPackage --foreign clipman # A simple clipboard manager for Wayland
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland

# Core
AddPackage discord # All-in-one voice and text chat for gamers that's free and secure.
AddPackage --foreign google-chrome # The popular and trusted web browser by Google (Stable Channel)

# Gnucash
AddPackage gnucash # Personal and small-business financial-accounting application
AddPackage libdbi-drivers # Database drivers for libdbi (MySQL, PostgreSQL, and SQLite)
AddPackage perl-date-manip # Date::Manip - date manipulation routines
AddPackage perl-finance-quote # Perl/CPAN Module Finance::Quote : Fetch stock prices over the Internet

# Media
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage pulseaudio # A featureful, general-purpose sound server
AddPackage pulseaudio-alsa # ALSA Configuration for PulseAudio
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket
