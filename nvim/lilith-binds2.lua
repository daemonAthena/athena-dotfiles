-- require('nvim-treesitter.configs').setup({
--   incremental_selection = 
--   {
--     enable = true,
--     keymaps = {
--       init_selection = '<C-l>',
--       node_incremental = '<C-l>',
--       scope_incremental = false,
--       node_decremental = '<bs>',
--     },
--   },
-- })

function create_set_buffer ()
    buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, buf)
    return buf
end
  
function remove_buffer (buf)
  if vim.api.nvim_buf_is_valid(buf) then
    vim.api.nvim_buf_delete(buf, { force = true })
  end
end

vim.keymap.set('n', '<leader>mm', function()
  local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 or root == '' then
    vim.notify('Not in a git repo', vim.log.levels.WARN)
    return
  end
  vim.cmd('edit ' .. vim.fn.fnameescape(root .. '/Makefile'))
end, { desc = 'Edit repo-root Makefile' })

vim.keymap.set('n', '<leader>bp', '<C-^>', { desc = 'Back to previous file' })

vim.keymap.set({'n','i','v'}, '<C-s>', function()
    local ft = vim.bo.filetype
    vim.cmd(":w")
    if ft == 'vim' or ft == 'lua' then
      vim.cmd('source ' .. vim.fn.expand('"%"'))
      vim.print('Sourced & Written~!')
    end
end
)

vim.keymap.set({'n','i'}, '<F5>', function()
  local ft = vim.bo.filetype
  
  -- FOR PYTHON
  if ft == 'python' then
    local file = vim.fn.shellescape(vim.fn.expand('%:p'))
    vim.cmd('lcd %:p:h')
    vim.cmd('botright split')

    -- Dedicate a buffer to the terminal
    buf = create_set_buffer()  
    
    vim.fn.termopen('python ' .. file .. '; exec $SHELL', {
      on_exit = function() vim.schedule( function()
        remove_buffer(buf)
        end)
    end, -- calback scheduled for exit
    })
    vim.cmd('startinsert')


  -- FOR C and C++
  elseif ft == 'c' or ft == 'cpp' then 
      local root = vim.fn.systemlist({
    'git', '-C', vim.fn.expand('%:p:h'), 'rev-parse', '--show-toplevel'
})[1]
      if vim.v.shell_error ~= 0 or root == '' then
        vim.notify('git rev-parse failed: ' .. (root or ''), vim.log.levels.WARN)
        return
      end

      --vim.print('Repo root: ' .. root)
      --vim.cmd('make -C ' .. vim.fn.shellescape(root) .. ' -k')
      vim.cmd('lcd ' .. root)
      vim.cmd('botright split')
      
      buf = create_set_buffer()
      vim.fn.termopen('sh -c ' .. vim.fn.shellescape('make -k; exec $SHELL'), {
        on_exit = function() vim.schedule(function()
          remove_buffer(buf)
          end
      ) end,
})
vim.cmd('startinsert')

  elseif ft == 'vim' or ft == 'lua' then
      vim.cmd('source %')
      vim.print('Sourced~!')
  else
    vim.notify('No F5 action for filetype: ' .. ft, vim.log.levels.WARN)
  end
end, { desc = 'Run/build current file' })


-- Select the whole current line
vim.keymap.set({'n','i','v'}, '<C-Space>', 'V', { desc = 'Select line' })
-- Move selected lines up/down (visual mode)
vim.keymap.set('x', '<A-Up>',   ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('x', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- Move current line up/down (normal mode)
vim.keymap.set('n', '<A-Up>',   ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('n', '<A-Down>', ':m .+2<CR>==', { desc = 'Move line down' })


local mc = require('multicursor-nvim')
mc.setup()

vim.keymap.set({ 'n', 'x' }, '<C-d>', function() mc.matchAddCursor(1) end, { desc = 'Add cursor on next match' })
vim.keymap.set('n', '<C-a-Down>', function() mc.lineAddCursor(1) end, { desc = 'Add cursor below' })
vim.keymap.set('n', '<C-a-Up>',   function() mc.lineAddCursor(-1) end, { desc = 'Add cursor above' })


vim.keymap.set('n', '<F12>', function()
  vim.cmd('botright split | terminal')
  vim.cmd('startinsert')
end, { desc = 'Open terminal split' })

vim.keymap.set('n', '<s-F12>', function()
  require('user.smart_split').terminal()
  vim.cmd('startinsert')
end, { desc = 'Open terminal smart split' })


-- require('image').setup({
--   backend = 'kitty',
--   scale_factor = 1.0,
--   x_height_window_percentage = nil,
--   tty_direct_chunk_size= 2048,
--   integrations= {
--     html = { enabled = true},
--     css = { enabled = true},
--   },
-- })


