local wezterm = require 'wezterm'

config = wezterm.config_builder()

config.scrollback_lines = 10000

config.enable_scroll_bar = true

config.font = wezterm.font 'Roboto Mono'
config.font_size = 12
config.colors = {
  foreground = '#b9b9b9',
  background = '#222222',
  scrollbar_thumb = '#b9b9b9',
}

return config
