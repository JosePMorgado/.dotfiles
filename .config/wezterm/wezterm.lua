-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

--config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.hide_tab_bar_if_only_one_tab = true

-- Settings
config.font_size = 14
config.font = wezterm.font("Hack", { weight = "Regular" })
config.font = wezterm.font_with_fallback({
	{ family = "Fira Code", weight = "Regular" },
})
config.window_background_opacity = 0.5

-- and finally, return the configuration to wezterm
return config
