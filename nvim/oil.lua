
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('oil').setup({
  skip_confirm_for_simple_edits=true,
})
vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'oil://*',
  callback = function()
    local oil = require('oil')
    local dir = oil.get_current_dir()
    if dir then vim.cmd('cd ' .. vim.fn.fnameescape(dir)) end
  end,
})
