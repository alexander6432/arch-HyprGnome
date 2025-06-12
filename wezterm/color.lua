local wezterm = require 'wezterm'

return {
  colors = {
    scrollbar_thumb = '#7287fd',
    copy_mode_active_highlight_bg = { Color = '#40a02b' },
    copy_mode_active_highlight_fg = { AnsiColor = 'White' },
    copy_mode_inactive_highlight_bg = { Color = '#d20f39' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

    tab_bar = {
      background = '#179299',
      active_tab = {
        bg_color = '#1e66f5',
        fg_color = '#ffffff',
        intensity = 'Bold',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = '#7287fd',
        fg_color = '#ffffff',

      },
      inactive_tab_hover = {
        bg_color = '#fe640b',
        fg_color = '#ffffff',
        italic = true,
      },
      new_tab = {
        bg_color = '#179299',
        fg_color = '#ffffff',
      },
      new_tab_hover = {
        bg_color = '#e64553',
        fg_color = '#ffffff',
        italic = true,
      },
    },

    quick_select_label_bg = { Color = '#df8e1d' },
    quick_select_label_fg = { AnsiColor = 'White' },
    quick_select_match_bg = { Color = '#7287fd' },
    quick_select_match_fg = { AnsiColor = 'White' },
  }
}
