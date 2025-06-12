local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    {
      key = 'p',
      mods = 'CTRL|SHIFT',
      action = act.ActivateCommandPalette
    },
    {
      key = '-',
      mods = 'CTRL',
      action = wezterm.action.DecreaseFontSize
    },
    {
      key = '+',
      mods = 'CTRL',
      action = wezterm.action.IncreaseFontSize
    },
    {
      key = 'Space',
      mods = 'CTRL|SHIFT',
      action = act.QuickSelect,
    },
    {
      key = 'c',
      mods = 'CTRL|SHIFT',
      action = act.ActivateCopyMode,
    },
    {
      key = 's',
      mods = 'CTRL|SHIFT',
      action = act.Search 'CurrentSelectionOrEmptyString',
    },
    {
      key = 'v',
      mods = 'CTRL|SHIFT',
      action = act.PasteFrom 'Clipboard',
    },
    {
      key = 't',
      mods = 'CTRL|SHIFT',
      action = act.SpawnTab 'DefaultDomain',
    },
    {
      key = 'q',
      mods = 'CTRL|SHIFT',
      action = act.CloseCurrentTab {
        confirm = true,
      },
    },
    {
      key = 'Tab',
      mods = 'CTRL',
      action = act.ActivateTabRelative(1)
    },
    {
      key = 'Tab',
      mods = 'CTRL|SHIFT',
      action = act.ActivateTabRelative(-1)
    },
    {
      key = 'h',
      mods = 'CTRL|SHIFT',
      action = act.SplitHorizontal {
        domain = 'DefaultDomain',
      },
    },
    {
      key = 'l',
      mods = 'CTRL|SHIFT',
      action = act.SplitVertical {
        domain = 'CurrentPaneDomain',
      },
    },
    {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = act.CloseCurrentPane {
        confirm = true,
      },
    },

    {
      key = 'LeftArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Left'
    },
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Right'
    },
    {
      key = 'UpArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Up'
    },
    {
      key = 'DownArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Down'
    },
  },
}
