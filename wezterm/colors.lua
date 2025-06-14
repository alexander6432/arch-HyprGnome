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
		colors.tertiary_container or "maroon",
		colors.tertiary or "green",
		colors.secondary_container or "olive",
		colors.secondary or "navy",
		colors.primary_container or "purple",
		colors.primary or "teal",
		colors.outline or "silver",
	},
	brights = {
		colors.outline_variant or "grey",
		colors.on_tertiary_fixed_variant or "red",
		colors.tertiary_fixed or "lime",
		colors.on_secondary_fixed_variant or "yellow",
		colors.secondary_fixed or "blue",
		colors.on_primary_fixed_variant or "fuchsia",
		colors.primary_fixed or "aqua",
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
