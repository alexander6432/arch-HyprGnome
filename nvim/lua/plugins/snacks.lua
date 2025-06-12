return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
            ░░░░░╗  ░░░╗     ░░░░░░░╗ ░░░╗  ░░░╗     󰣇
           ▒▒╔══▒▒╗ ▒▒▒║     ▒▒╔════╝ ╚▒▒▒╗▒▒▒╔╝     
           ▒▒▒▒▒▒▒║ ▒▒▒║     ▒▒▒▒▒▒╗   ╚▒▒▒▒▒╔╝      
           ██╔══██║ ███║     ██╔═══╝   ███╔███╗      
           ██║  ██║ ███████╗ ███████╗ ███╔╝ ███╗     
           ╚═╝  ╚═╝ ╚══════╝ ╚══════╝ ╚══╝  ╚══╝     󰣚
        ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Explorador de Archivos", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "Nuevo Archivo", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Buscar por Palabra", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Archivos Recientes", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Configuración", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restaurar Sesión", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Salir", action = ":qa" },
        },
      },
    },
    image = {
      formats = {
        "png",
        "jpg",
        "jpeg",
        "webp",
      },
    },
    picker = {
      icons = {
        files = {
          enabled = true, -- show file icons
          dir = "󰉋 ",
          dir_open = "󰝰 ",
          file = "󰈔 "
        },
        keymaps = {
          nowait = "󰓅 "
        },
        tree = {
          vertical = "│ ",
          middle   = "├╴",
          last     = "└╴",
        },
        undo = {
          saved = " ",
        },
        ui = {
          live       = "󰐰 ",
          hidden     = "h",
          ignored    = "i",
          follow     = "f",
          selected   = "● ",
          unselected = "○ ",
          -- selected = " ",
        },
        git = {
          enabled   = true, -- show git icons
          commit    = "󰜘 ", -- used by git log
          staged    = " ", -- staged changes. always overrides the type icons
          added     = " ",
          deleted   = "󰆴 ",
          ignored   = " ",
          modified  = " ",
          renamed   = " ",
          unmerged  = " ",
          untracked = "? ",
        },
        diagnostics = {
          Error = " ",
          Warn  = " ",
          Hint  = " ",
          Info  = " ",
        },
        lsp = {
          unavailable = "",
          enabled = " ",
          disabled = " ",
          attached = "󰖩 "
        },
        kinds = {
          Array         = " ",
          Boolean       = "󰨙 ",
          Class         = " ",
          Color         = " ",
          Control       = " ",
          Collapsed     = "󰡍 ",
          Constant      = "󰏿 ",
          Constructor   = " ",
          Copilot       = " ",
          Enum          = " ",
          EnumMember    = " ",
          Event         = " ",
          Field         = " ",
          File          = "󰈔 ",
          Folder        = " ",
          Function      = "󰊕 ",
          Interface     = " ",
          Key           = " ",
          Keyword       = " ",
          Method        = " ",
          Module        = "󰕳 ",
          Namespace     = " ",
          Null          = "󰟢 ",
          Number        = "󰎠 ",
          Object        = " ",
          Operator      = " ",
          Package       = " ",
          Property      = " ",
          Reference     = " ",
          Snippet       = " ",
          String        = " ",
          Struct        = " ",
          Text          = " ",
          TypeParameter = " ",
          Unit          = " ",
          Unknown       = " ",
          Value         = " ",
          Variable      = " ",
        },
      },
    },
  },
}
