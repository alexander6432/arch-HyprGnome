-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Salir del Modo Terminal' })
vim.keymap.set('n', '<leader>t', '', { desc = "Terminal" })
vim.keymap.set('n', '<leader>tp', function()
  vim.cmd('tabnew')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end, { desc = "Abrir Terminal en Nueva Pestaña" })
vim.keymap.set('n', '<leader>th', function()
  vim.cmd('15split')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end, { desc = "Abrir Terminal en Horizontal" })
vim.keymap.set('n', '<leader>tv', function()
  vim.cmd('80vsplit')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end, { desc = "Abrir Terminal en Vertical" })

-- vim.keymap.set('n', '<leader>tt', function()
--   local buf = vim.api.nvim_create_buf(true, false) -- buffer sin archivo y oculto
--   local width = math.floor(vim.o.columns * 0.5)
--   local height = math.floor(vim.o.lines * 0.5)
--   local row = math.floor(0)
--   local col = math.floor((vim.o.columns - width))
--
--   local win = vim.api.nvim_open_win(buf, true, {
--     relative = 'editor',
--     width = width,
--     height = height,
--     row = row,
--     col = col,
--     style = 'minimal',
--     border = 'rounded',
--   })
--   -- Inicia una terminal en el buffer flotante
--   vim.fn.termopen(os.getenv('SHELL') or 'zsh') -- o 'zsh' si prefieres
--   vim.cmd("startinsert")
-- end, { desc = "Terminal flotante" })
