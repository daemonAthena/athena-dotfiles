set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" Source List

lua vim.opt.clipboard = 'unnamedplus'
lua vim.opt.paste = false
lua vim.opt.whichwrap:append('<,>,[,]')
set splitright
set nohlsearch
set wrap
set linebreak


"source ~/.config/nvim/lilith-binds.vim

execute 'source ' .. stdpath("config") .. '/lilith-binds.vim'


" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'catppuccin/nvim'
Plugin 'kevinhwang91/rnvimr'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'nvim-mini/mini.icons'
Plugin 'nvim-tree/nvim-web-devicons'
Plugin 'MeanderingProgrammer/render-markdown.nvim'
"Plugin 'iamcco/markdown-preview.nvim'
"Plugin 'vimwiki/vimwiki'
"Plugin 'm4xshen/autoclose.nvim'
"Plugin 'altermo/ultimate-autopair.nvim'
"Plugin 'pohlrabi404/compile.nvim'
Plugin 'jake-stewart/multicursor.nvim'
Plugin 'numToStr/Comment.nvim'
Plugin 'vyfor/cord.nvim' 
"Plugin '3rd/image.nvim'
Plugin 'stevearc/oil.nvim'
call vundle#end()

filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
"highlight Normal ctermbg=black
"lua require("autoclose").setup()

"lua require('compile').setup({enter=true},{cmds={default={'make -C "$(git rev-parse --show-toplevel)" -k && cd "$(git rev-parse --show-toplevel)"'}}})


"""""""""""""""""""""""""""
"""POST PLUGIN INCLUDES""""
"""""""""""""""""""""""""""

"source ~/.config/nvim/lilith-binds2.lua
execute 'source ' .. stdpath("config") .. '/lilith-binds2.lua' 


lua vim.o.splitright = true
lua vim.o.splitbelow = true

"source ~/.config/nvim/oil.lua
execute 'source ' .. stdpath("config") .. '/oil.lua'

lua << EOF
local ss = require('user.smart_split')
vim.keymap.set('n', '<A-n>', function()
  local p = vim.fn.expand('%:h')
  if p ~= '' and (vim.fn.filereadable(p) == 1 or vim.fn.isdirectory(p) == 1) then
    ss.open(p)
  else
    vim.notify('No file to split', vim.log.levels.WARN)
  end
end)
EOF


lua vim.keymap.set('n','<a-c>', function() require('user.smart_split').open(vim.fn.stdpath('config')..'/init.vim')end)
lua vim.keymap.set('n','<a-l>',function() require('user.smart_split').open(os.getenv('LUMINARA_C'))end)
lua vim.keymap.set('n','<a-p>',function() require('user.smart_split').open(os.getenv('HOME') .. '/Programming/Lilith Projects')end)


"source ~/.config/nvim/rnvimr.lua




"""RENDER MARKDOWN"""
lua require("render-markdown").setup({file_types = { "markdown"}})


"lua require("catppuccin").setup({transparent_background = true})
lua vim.cmd.colorscheme "catppuccin-nvim"
"lua require("autoclose").setup({options = {disable_when_touch = {true},pair_spaces={true}}})



"source ~/.config/nvim/markdown.lua
execute 'source ' .. stdpath("config") .. '/markdown.lua'


set t_Co=256
set foldmethod=indent
set foldlevel=99

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
"set textwidth=80


augroup ShortIndent
  autocmd!
  autocmd BufNewFile,BufRead *.sh,*.lua,*.vim
    \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent fileformat=unix
augroup END


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

let g:ale_linters = {'python': ['flake8']}

set number

packadd coc.nvim
"source ~/.config/nvim/coc.lua
execute 'source ' .. stdpath("config") .. '/coc.lua'

