local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font_size = 12
config.font= wezterm.font "JetBrains Mono"
config.color_scheme = 'Catppuccin Mocha'

return config
