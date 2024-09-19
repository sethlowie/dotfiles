local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.85
config.macos_window_background_blur = 90

config.color_scheme = "MaterialOcean"

config.window_padding = {
	left = 36,
	right = 36,
	top = 0,
	bottom = 0,
}

-- config.exit_behavior = "Hold"

-- config.keys = {
-- 	-- Bind Ctrl+C to the standard interrupt (SIGINT) behavior
-- 	{
-- 		key = "c",
-- 		mods = "CTRL",
-- 		action = wezterm.action.SendKey({
-- 			key = "c",
-- 			mods = "CTRL",
-- 		}),
-- 	},
-- }

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "/Users/sethlowie/Pictures/Wallpapers/nasa-Q1p7bh3SHj8-unsplash.jpg",
-- 		},
-- 		hsb = {
-- 			hue = 1.0,
-- 			saturation = 1.02,
-- 			brightness = 0.25,
-- 		},
-- 		width = "100%",
-- 		height = "100%",
-- 	},
-- 	{
-- 		source = {
-- 			Color = "#000",
-- 		},
-- 		width = "100%",
-- 		height = "100%",
-- 		opacity = 0.7,
-- 	},
-- }

return config
