-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.initial_cols = 120

-- For example, changing the color scheme:
-- config.color_scheme = 'Blue Matrix'
config.color_scheme = 'Abernathy'
-- config.color_scheme = 'Argonaut'
-- config.color_scheme = 'Bright (base16)'
-- config.color_scheme = 'carbonfox'
-- config.color_scheme = 'Cyberdyne'
-- config.color_scheme = 'cyberpunk'
-- config.color_scheme = 'Dark Pastel'
-- config.color_scheme = 'Dark Violet (base16)'
-- config.color_scheme = 'Dissonance (Gogh)'

config.font = wezterm.font('JetBrains Mono')

config.window_background_opacity = 0.90

-- and finally, return the configuration to wezterm
return config
