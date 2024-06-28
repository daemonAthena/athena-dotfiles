" Bindings

" ctrl+z = undo
imap <c-z> <ESC>ua
nmap <c-z> u

" ctrl+c = copy
vmap <c-c> "+y
imap <c-c> <ESC>"+yy
nmap <c-c> "+yy

" ctrl+v = paste
vmap <c-v> p
imap <c-v> <ESC>pi
nmap <c-v> p
 
" ctrl+x = cut 
vmap <c-x> d
imap <c-x> <ESC>^d$a
nmap <c-x> ^d$

" backspace in visual mode = delete hilighted
vmap <BS> i<BS>

" shift+up = hilight above line
imap <s-Up> <ESC>vk
nmap <s-Up> vk
vmap <s-Up> k

" shift+down = hilight below line
imap <s-Down> <ESC>vj
nmap <s-Down> vj
vmap <s-Down> j

" shift+right = hilight next letter
imap <s-Right> <ESC>vl
nmap <s-Right> vl
vmap <s-Right> l

" shift+left = hilight prior letter
imap <s-Left> <ESC>vh
nmap <s-Left> vh
vmap <s-Left> h

" ctrl+shift+right = hilight a word to the right
"imap <C-S-Right> <ESC>vE
"nmap <C-S-Right> vE
"vmap <C-S-Right> E

" ctrl+shift+left = hilight a word to the left
"imap <C-S-Left> <ESC>vB
"nmap <C-S-Left> vB
"vmap <C-S-Left> B

" backspace = delete letter behind and enter insert mode
nmap <BS> xi

" ctrl+backspace = delete word behind
imap <c-BS> <ESC>dBxa
nmap <c-BS> dBxa

" ctrl+e = End of line
nmap <c-e> $
imap <c-e> <ESC>$a

" ctrl+q = Beginning of line
nmap <c-q> ^
imap <c-q> <ESC>^i

" ctrl+s = Save
nmap <c-s> :w<CR>
imap <c-s> <ESC>:w<CR>a

" enter = enter button in nmap
nmap <CR> i<CR>

" ctrl+up = move up a bunch of lines 
nmap <C-Up> 5k
imap <C-Up> <ESC>5ka
vmap <C-Up> 5k

" ctrl+down = move down a bunch of lines
nmap <C-Down> 5j
imap <C-Down> <ESC>5ja
vmap <C-Down> 5j

" ctrl+right = move to the next expression
nmap <C-Right> E
imap <C-Right> <ESC>Ea
vmap <C-Right> E

" ctrl+left = move to the previous expression 
nmap <C-Left> B
imap <C-Left> <ESC>Bi
vmap <C-Left> B

" ctrl+shift+s = save and quit
"nmap <C-S-s> :wq<CR>
"imap <C-S-s> <ESC>:wq<CR>

" alt + tab = advance a vim tab
nmap <a-tab> :tabn<CR>
imap <a-tab> <ESC>:tabn<CR>

" alt + shift + tab = previous vim tab
nmap <a-s-tab> :tabp<CR>
imap <a-s-tab> <ESC>:tabp<CR>

" alt + w = close vim tab
nmap <a-w> :w<CR>:tabclose<CR>
imap <a-w> <ESC>:w<CR>:tabclose<CR>

" alt + shift + w = quit vim and save
nmap <a-s-w> :wq<CR>
imap <a-s-w> <ESC>:wq<CR>

" F5 = run program with console output and take custom user input 

" No user input
"nmap <F5> :w<enter>:!%:p<enter>
"imap <F5> <esc>:w<enter>:!%:p<enter>

function! RunInput()
  let cmd = "!% " .. input("arguments: ")
  redraw
  return cmd
endfunction

nmap <F5> :exe RunInput()<enter>
imap <F5> <esc>:exe RunInput()<enter>

" tab = tab in insert mode
" works with multiple lines in visual mode
nmap <tab> i<tab>
vmap <tab> >

" shift+tab = tab back
nmap <s-tab> <h
imap <s-tab> <ESC><hi
vmap <s-tab> <

" ----------
"  PLUGIN KEYBINDS
" ----------

" alt+e = Rnvimr file manager floating
nmap <a-e> :RnvimrToggle<CR>
imap <a-e> <ESC>:RnvimrToggle<CR>
