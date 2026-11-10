local ss = require('user.smart_split')

vim.keymap.set('n', '<A-n>', function()
  local p = vim.fn.expand('%:h')
  if p ~= '' and (vim.fn.filereadable(p) == 1 or vim.fn.isdirectory(p) == 1) then
    ss.open(p)
  else
    vim.notify('No file to split', vim.log.levels.WARN)
  end
end)
