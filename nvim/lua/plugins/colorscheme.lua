return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = {
    style = "moon",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark",
      floats = "dark",
    },
  },
}
