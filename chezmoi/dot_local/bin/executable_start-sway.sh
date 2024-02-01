#!/usr/bin/env bash

# Set WLRoots renderer to Vulkan to avoid flickering
export WLR_RENDERER=vulkan

# General wayland environment variables
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export SDL_VIDEODRIVER=wayland

# Xwayland compatibility
export XWAYLAND_NO_GLAMOR=1

exec sway
