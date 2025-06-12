return {
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = true },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ff768e" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f5f57B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#5aa2ff" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e0af48" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#7efe6a" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#bb7aff" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#7dcfff" })
      end)

      require("ibl").setup({ indent = { highlight = highlight } })
    end,

    opts = function()
      Snacks.toggle({
        name = "Indention Guides",
        get = function()
          return require("ibl.config").get_config(0).enabled
        end,
        set = function(state)
          require("ibl").setup_buffer(0, { enabled = state })
        end,
      }):map("<leader>ug")
      return {
        indent = {
          char = "▎",
          tab_char = "▎",
        },
        scope = { show_start = false, show_end = false },
        exclude = {
          filetypes = {
            "Trouble",
            "alpha",
            "dashboard",
            "help",
            "lazy",
            "mason",
            "neo-tree",
            "notify",
            "snacks_dashboard",
            "snacks_notif",
            "snacks_terminal",
            "snacks_win",
            "toggleterm",
            "trouble",
          },
        },
      }
    end,
    main = "ibl",
  },
}
