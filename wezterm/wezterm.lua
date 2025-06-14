local wezterm = require("wezterm")
local copy_mode = require("keybindings.copy_mode")
local search_mode = require("keybindings.search_mode")
local keys = require("keybindings.keybindings")
local colors = require("colors")

local config = wezterm.config_builder()

config.colors = colors
-- config.color_scheme = "Catppuccin Mocha"
config.cursor_blink_rate = 500
config.cursor_thickness = 2
config.default_cursor_style = "BlinkingBar"
config.disable_default_key_bindings = true
config.enable_scroll_bar = true
config.enable_wayland = false
config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	stretch = "Normal",
	weight = "Regular",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})
config.front_end = "OpenGL"
config.font_size = 9.5
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.75,
}
config.keys = keys.keys
config.key_tables = {
	copy_mode = copy_mode.key_tables.copy_mode,
	search_mode = search_mode.key_tables.search_mode,
}
config.scrollback_lines = 700
config.text_background_opacity = 1
config.tab_max_width = 20
config.use_fancy_tab_bar = true
config.window_background_opacity = 0.9

local function get_opacity_from_title(title)
	if not title then
		return 0.75
	end
	title = title:lower()

	if title:find("nvim") then
		return 0.85
	elseif title:find("btop") then
		return 0.5
	elseif title:find("yazi") or title:find("jazz") then
		return 0.67
	else
		return 0.75
	end
end

wezterm.on("update-right-status", function(window, pane)
	local process_name = pane:get_foreground_process_name()
	local overrides = window:get_config_overrides() or {}
	local title = window:active_pane():get_title()

	local opacity = 0.75

	if process_name then
		local prog = process_name:match("([^/\\]+)$")

		if prog == "zellij" then
			opacity = get_opacity_from_title(title)
		elseif prog == "nvim" then
			opacity = 0.85
		elseif prog == "htop" then
			opacity = 0.5
		elseif prog == "yazi" then
			opacity = 0.67
		end
	end

	if overrides.window_background_opacity ~= opacity then
		overrides.window_background_opacity = opacity
		window:set_config_overrides(overrides)
	end
end)

return config
