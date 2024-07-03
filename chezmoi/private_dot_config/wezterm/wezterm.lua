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

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  pane:split { size = 0.5 }
end)

return config
