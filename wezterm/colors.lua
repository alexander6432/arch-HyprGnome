local colors = require("colors_wezterm")

return {
	foreground = colors.on_background or "silver",
	background = colors.background or "black",

	cursor_bg = colors.primary or "#52ad70",
	cursor_fg = colors.on_primary_fixed or "black",
	cursor_border = colors.primary or "#52ad70",

	selection_fg = colors.on_primary_fixed_hue180 or "black",
	selection_bg = colors.primary_hue180 or "#fffacd",

	scrollbar_thumb = colors.on_primary or "#222222",

	split = colors.primary or "#444444",

	ansi = {
		colors.background or "black",
		colors.primary_dark_hue180 or "maroon",
		colors.primary_dark_hue300 or "green",
		colors.primary_dark_hue240 or "olive",
		colors.primary_dark_hue60 or "navy",
		colors.primary_dark_hue120 or "purple",
		colors.primary_dark or "teal",
		colors.outline or "silver",
	},
	brights = {
		colors.outline_variant or "grey",
		colors.primary_hue180 or "red",
		colors.primary_hue300 or "lime",
		colors.primary_hue240 or "yellow",
		colors.primary_hue60 or "blue",
		colors.primary_hue120 or "fuchsia",
		colors.primary or "aqua",
		colors.on_background or "white",
	},

	indexed = { [136] = colors.primary },

	compose_cursor = colors.inverse_primary,

	copy_mode_active_highlight_bg = { Color = colors.background },
	copy_mode_active_highlight_fg = { Color = colors.background },
	copy_mode_inactive_highlight_bg = { Color = colors.primary_hue120 },
	copy_mode_inactive_highlight_fg = { Color = colors.on_primary_hue120 },

	quick_select_label_bg = { Color = colors.primary_container },
	quick_select_label_fg = { Color = colors.primary },
	quick_select_match_bg = { Color = colors.primary_container_hue180 },
	quick_select_match_fg = { Color = colors.primary_hue180 },
}
