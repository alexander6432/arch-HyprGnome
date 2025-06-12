return {
  "ziontee113/color-picker.nvim",
  config = true,
  keys = {
    { "<C-c>", "<cmd>PickColor<cr>",       mode = "n", desc = "ColorPicker" },
    { "<C-c>", "<cmd>PickColorInsert<cr>", mode = "i", desc = "ColorPicker" },
  },
  opts = {
    icons = { "󰝤", "" },
    border = "rounded", -- none | single | double | rounded | solid | shadow
    keymap = {
      ["<Left>"] = "<Plug>ColorPickerSlider1Decrease",
      ["<Right>"] = "<Plug>ColorPickerSlider1Increase",

      ["<cr>"] = "<Plug>ColorPickerApplyColor",
      ["."] = "<Plug>ColorPickerChangeOutputType",
      [","] = "<Plug>ColorPickerChangeColorMode",
      ["-"] = "<Plug>ColorPickerToggleTransparency",
    },
    background_highlight_group = "Normal",
    border_highlight_group = "FloatBorder",
    text_highlight_group = "Normal",
  },
}
