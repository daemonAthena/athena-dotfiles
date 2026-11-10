
-- Rnvimr
vim.g.rnvimr_enable_ex = 1

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if vim.fn.isdirectory(bufname) == 1 then
      vim.cmd('bdelete')          -- close the directory buffer
      vim.cmd('cd ' .. vim.fn.fnameescape(bufname))
      vim.cmd('RnvimrToggle')
    end
  end,
})

vim.g.rnvimr_action = { ['<A-t>'] = 'RnvimrSmartSplit' }


