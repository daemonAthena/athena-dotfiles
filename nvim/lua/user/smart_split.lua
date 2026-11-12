-- Coauthored by heremes



local M = {}

-- True when the current window holds a blank, unnamed, unmodified buffer
-- (the "new file" you get when launching nvim with no arguments).
local function is_blank_newfile()
  local buf = vim.api.nvim_get_current_buf()
  if vim.api.nvim_get_option_value('buftype', { buf = buf }) ~= '' then return false end
  if vim.api.nvim_buf_get_name(buf) ~= '' then return false end
  if vim.api.nvim_get_option_value('modified', { buf = buf }) then return false end
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  return #lines == 0 or (#lines == 1 and lines[1] == '')
end

function M.open(file)
  -- No split: overwrite the blank buffer in the current window.
  if is_blank_newfile() then
    vim.cmd('edit ' .. vim.fn.fnameescape(file))
    return
  end

  local layout = vim.fn.winlayout()
  local has_col = false
  local function scan(node)
    if type(node) ~= 'table' then return end
    if node[1] == 'col' then has_col = true end
    for i = 2, #node do scan(node[i]) end
  end
  scan(layout)

  if has_col then
    vim.cmd('tabnew ' .. vim.fn.fnameescape(file))
  elseif layout[1] == 'row' then
    vim.cmd('split ' .. vim.fn.fnameescape(file))
  else
    vim.cmd('vsplit ' .. vim.fn.fnameescape(file))
  end
end

function M.terminal()
  if is_blank_newfile() then
    vim.cmd('terminal')
    return
  end

  local layout = vim.fn.winlayout()
  local has_col = false
  local function scan(node)
    if type(node) ~= 'table' then return end
    if node[1] == 'col' then has_col = true end
    for i = 2, #node do scan(node[i]) end
  end
  scan(layout)

  if has_col then
    vim.cmd('tabnew | terminal') 
  elseif layout[1] == 'row' then
    vim.cmd('split | terminal')
  else
    vim.cmd('vsplit | terminal')
  end
end
return M



-- local function smart_split(file)
--   local layout = vim.fn.winlayout()
--   local has_col = false  -- 'col' = horizontal split (stacked)
--
--   local function scan(node)
--     if type(node) ~= 'table' then return end
--     if node[1] == 'col' then has_col = true end
--     for i = 2, #node do scan(node[i]) end
--   end
--
--   scan(layout)
--
--   if has_col then
--     vim.cmd('tabnew ' .. vim.fn.fnameescape(file))
--   elseif layout[1] == 'row' then
--     -- vertical split exists -> horizontal split
--     vim.cmd('split ' .. vim.fn.fnameescape(file))
--   else
--     -- single window -> vertical split
--     vim.cmd('vsplit ' .. vim.fn.fnameescape(file))
--   end
-- end
--
-- vim.keymap.set('n', '<A-n>', function()
--   local path = vim.fn.expand('%:p')
--   if path ~= '' and vim.fn.filereadable(path) == 1 then
--     smart_split(path)
--   else
--     -- no real file: just a new split/tab with empty buffer
--     if vim.fn.winlayout()[1] == 'col' then
--       vim.cmd('tabnew')
--     elseif vim.fn.winlayout()[1] == 'row' then
--       vim.cmd('hsplit')
--     else
--       vim.cmd('vsplit')
--     end
--   end
-- end, { desc = 'Duplicate current file in new split/tab' })
-- -- " alt+c take me to my config file
-- nmap <a-c> :tabnew<CR>:edit ~/.config/nvim/init.vim<CR>
-- " alt+l take me to Luminara
-- nmap <a-l> :tabnew<CR>:edit $LUMINARA_C<CR>
-- " alt+m take me to the make file of the repo
-- "nmap <a-m> :tabnew<CR>:let x = !$(git rev-parse --show-toplevel)<CR>:edit x<CR>



-- vim.keymap.set('n', '<A-n>', function()
--   local path = vim.fn.expand('~')
--   vim.print(path)
--   if path ~= '' and ( vim.fn.isdirectory(path) ) == 1 then
--     smart_split(path)
--   else
--     -- no real file: just a new split/tab with empty buffer
--     if vim.fn.winlayout()[1] == 'col' then
--       vim.cmd('tabnew')
--     elseif vim.fn.winlayout()[1] == 'row' then
--       vim.cmd('hsplit')
--     else
--       vim.cmd('vsplit')
--     end
--     vim.notify('Not a readable file or directory', vim.log.levels.WARN)
--   end
--
-- end, { desc = 'Duplicate current file in new split/tab' })
