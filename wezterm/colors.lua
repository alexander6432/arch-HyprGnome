local colors = require("colors_wezterm")

return {
	foreground = colors.on_background or "silver",
	background = colors.background or "black",

	cursor_bg = colors.primary or "#52ad70",
	cursor_fg = colors.on_primary_fixed or "black",
	cursor_border = colors.primary or "#52ad70",

	selection_fg = colors.on_secondary_fixed or "black",
	selection_bg = colors.secondary or "#fffacd",

	scrollbar_thumb = colors.on_primary or "#222222",

	split = colors.primary or "#444444",

	ansi = {
		colors.background or "black",
		colors.on_error or "maroon",
		colors.on_tertiary or "green",
		colors.on_secondary or "olive",
		colors.on_primary or "navy",
		colors.on_error or "purple",
		colors.on_primary or "teal",
		colors.on_surface_variant or "silver",
	},
	brights = {
		colors.outline or "grey",
		colors.error or "red",
		colors.tertiary or "lime",
		colors.secondary or "yellow",
		colors.primary or "blue",
		colors.error or "fuchsia",
		colors.primary or "aqua",
		colors.on_background or "white",
	},

	indexed = { [136] = colors.primary },

	compose_cursor = colors.inverse_primary,

	copy_mode_active_highlight_bg = { Color = colors.background },
	copy_mode_active_highlight_fg = { Color = colors.background },
	copy_mode_inactive_highlight_bg = { Color = colors.tertiary },
	copy_mode_inactive_highlight_fg = { Color = colors.on_tertiary },

	quick_select_label_bg = { Color = colors.primary_container },
	quick_select_label_fg = { Color = colors.primary },
	quick_select_match_bg = { Color = colors.secondary_container },
	quick_select_match_fg = { Color = colors.secondary },
}
