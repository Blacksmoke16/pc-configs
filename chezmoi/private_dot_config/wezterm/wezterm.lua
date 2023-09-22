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

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir
  local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

  return current_dir == HOME_DIR and "." or string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local title = string.format(" %s  %s ~ %s  ", "❯", get_current_working_dir(tab))


  return {
      { Text = title },
  }
end)


return config
