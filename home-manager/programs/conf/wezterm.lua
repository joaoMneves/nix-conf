-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.font_size = 14
config.color_scheme = 'Dracula'

config.font = wezterm.font 'FiraCode Nerd Font'

-- Finally, return the configuration to wezterm:
return config
