
vim.g.coc_global_extensions = { 'coc-pyright', 'coc-clangd' }
 
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = 'yes'
vim.opt.laststatus = 2
 
-- Show coc.nvim status, including extension installation progress
vim.opt.statusline:prepend('%{coc#status()}')
 
local keyset = vim.keymap.set
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
-- Trigger completion with C-space and navigate the completion menu
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset('i', '<C-space>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<C-space>" : coc#refresh()', opts)
keyset('i', '<C-s-space>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-s-space>"]], opts)
keyset('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { silent = true, expr = true })

-- Scroll the completion menu with Up/Down when it is visible
keyset('i', '<Up>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"]], opts)
keyset('i', '<Down>', [[coc#pum#visible() ? coc#pum#next(1) : "\<Down>"]], opts)

-- Tab confirms the selected completion item
keyset('i', '<Tab>', [[coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"]], opts)

-- Diagnostics and code navigation
keyset('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
keyset('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })
keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })
keyset('n', '<f2>', '<Plug>(coc-rename)', { silent = true })



