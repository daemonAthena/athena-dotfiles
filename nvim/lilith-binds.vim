" Bindings

" Remap h and j to respect word wordwrap
nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up>   <C-o>gk
inoremap <Down> <C-o>gj
" ctrl+z = undo
lnoremap <c-z> <ESC>ui
inoremap <c-z> <ESC>ui
nnoremap <c-z> u
vnoremap <c-z> u

" ctrl+c = copy
vnoremap <c-c> y
lnoremap <c-c> <ESC>^y$i
inoremap <c-c> <ESC>^y$i
nnoremap <c-c> ^y$


"" ctrl+v = paste
vnoremap <c-v> p
lnoremap <c-v> <ESC>pi
inoremap <c-v> <ESC>pi
nnoremap <c-v> p
 
" ctrl+x = cut 
vnoremap <c-x> d
lnoremap <c-x> <ESC>^d$a
nnoremap <c-x> ^d$

"" ctrl+up = move up a bunch of lines 
nmap <C-Up> k{j
imap <C-Up> <esc>k{ji

"" ctrl+down = move down a bunch of lines
nmap <C-Down> j}k
imap <C-Down> <esc>j}ki

" ctrl + shift = highlight in paragraphs when up and down & words when left and right
" ctrl+shift+right = hilight a word to the right
inoremap <c-s-Right> <Right><ESC>vE
nnoremap <c-s-Right> vE
vnoremap <c-s-Right> E

" ctrl+shift+left = hilight a word to the left
inoremap <C-S-Left> <Left><ESC>vB
nnoremap <C-S-Left> vB
vnoremap <C-S-Left> B

"ctrl + shift + up/down = highlight a word up or down a paragraph
nmap <C-s-Up> vk{j
imap <C-s-Up> <esc>vk{j
vmap <C-s-Up> k{j

nmap <C-s-Down> vj}k
imap <C-s-Down> <esc>vj}k
vmap <C-s-Down> j}k

" backspace in visual mode = delete hilighted
vmap <BS> d

" shift + direction highlight in direction
imap <s-Up> <ESC>vk
nmap <s-Up> vk
vmap <s-Up> k

imap <s-Down> <ESC>vj
nmap <s-Down> vj
vmap <s-Down> j

imap <s-Right> l<ESC>vl
nmap <s-Right> vl
vmap <s-Right> l

imap <s-Left> h<ESC>vh
nmap <s-Left> vh
vmap <s-Left> h

" backspace = delete letter behind and enter insert mode
nmap <BS> dhi

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


" ctrl+right = move to the next expression
nmap <C-Right> E
imap <C-Right> <ESC>Ea
vmap <C-Right> E

" ctrl+left = move to the previous expression 
nmap <C-Left> B
imap <C-Left> <ESC>Bi
vmap <C-Left> B


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
"nmap <CR> i<CR>

" ctrl+right = move to the next expression
nmap <C-Right> E
imap <C-Right> <ESC>Ea
vmap <C-Right> E



" ctrl+left = move to the previous expression 
nmap <C-Left> B
imap <C-Left> <ESC>Bi
vmap <C-Left> B

" alt + n = create new vim tab
"nmap <a-n> :tabnew<CR>
"imap <a-n> :tabnew<CR>

" alt+right = advance a vim tab in normal mode
nnoremap <a-right> :tabn<CR>

" alt+left = previous vim tab in normal mode
nnoremap <a-left> :tabp<CR>

" ctrl + w = close and save vim tab
nnoremap <c-w> :wq<CR>
inoremap <c-w> <ESC>:wq<CR>

" alt + shift + w = force close vim tab and dont save
nmap <a-s-w> :q<CR>
imap <a-s-w> <ESC>:q<CR>

" 
"F5 = run program with console output and take custom user input 

" No user input
"nmap <F
"5> :w<enter>:!%:p<enter>
"imap <F5> <esc>:w<enter>:!%:p<enter>

"function! 
"RunInput()
"  let cmd = "!% " .. input("arguments: ")
"  redraw
"  return cmd
"endfunction
"nmap <F5> :cd %:p:h<enter>\cc
"imap <F5> <esc>:cd %:p:h<enter>\cc


" Comment codeblock
" Using the numToStr/Comment.nvim
nmap // gc$
vmap // gc

" edit makefile

" tab = tab in insert mode
" works with multiple lines in visual mode
vmap <tab> >

" shift+tab = tab back in insert mode and visual mode
imap <s-tab> <ESC><hi
vmap <s-tab> <



" alt+c take me to my config file
"nmap <a-c> :tabnew<CR>:edit ~/.config/nvim/init.vim<CR>
" alt+l take me to Luminara
"nmap <a-l> :tabnew<CR>:edit $LUMINARA_C<CR>
" alt+m take me to the make file of the repo
"nmap <a-m> :tabnew<CR>:let x = !$(git rev-parse --show-toplevel)<CR>:edit x<CR>

" ctrl + enter when on a link will take you to the file in a new tab

nmap <C-CR> gf<CR>
nmap <C-o> :bf<CR>
nmap <C-i> :bp<CR>




"Autoclose brackets around highlighted area


" works for anything on the same line but not multilines
"vnoremap (( c(<C-r>=substitute(@", '\n$', '', '')<CR>)
vnoremap "" c"<C-r>=substitute(@", '\n$', '', '')<CR>"
vnoremap \\ c[<C-r>=substitute(@", '\n$', '', '')<CR>]
vnoremap \2 c[[<C-r>=substitute(@", '\n$', '', '')<CR>]]
"vnoremap {{ c{<C-r>=substitute(@", '\n$', '', '')<CR>}


" works for multilines not single words
vnoremap (( :s/\%'<\ze/(/e <Bar> '<,'>s/\%'>\zs/)/e<CR>
"vnoremap "" :s/\%'<\ze/"/e <Bar> '<,'>s/\%'>\zs/"/e<CR>
"vnoremap \\ :s/\%'<\ze/[/e <Bar> '<,'>s/\%'>\zs/]/e<CR>
vnoremap {{ :s/\%'<\ze/{/e <Bar> '<,'>s/\%'>\zs/}/e<CR>


" word based
nnoremap \\ viwc[<C-r>=substitute(@", '\n$', '', '')<CR>]
nnoremap \2 viwc[[<C-r>=substitute(@", '\n$', '', '')<CR>]]
nnoremap (( viwc(<C-r>=substitute(@", '\n$', '', '')<CR>)
nnoremap {{ viwc{<C-r>=substitute(@", '\n$', '', '')<CR>}
nnoremap "" viwc"<C-r>=substitute(@", '\n$', '', '')<CR>"

" Bold 
inoremap <c-b> <Esc>viwc**<C-r>"**
nnoremap <c-b> viwc**<C-r>"**<Esc>
vnoremap <c-b> c**<C-r>=substitute(@", '\n$', '', '')<CR>**

"itallics
inoremap <c-i> <Esc>viwc*<C-r>"*
nnoremap <c-i> viwc*<C-r>"*<Esc>
vnoremap <c-i> c*<C-r>=substitute(@", '\n$', '', '')<CR>*

" Replace Mode
"vnoremap <C-f> "hy:%s/<C-r>h//gc<left><left><left> 

" ----------
"  PLUGIN KEYBINDS
" ----------

" === Rnvimr ===

" alt+e = Rnvimr file manager floating
nnoremap <a-e> :RnvimrToggle<CR>
inoremap <a-e> <ESC>:RnvimrToggle<CR>
tnoremap <a-e> :<C-\><C-n>:RnvimrToggle<CR>

" alt+shift+= = zoom adjust size of rnvimr
tnoremap <silent> <a-s-=> <C-\><C-n>:RnvimrResize<CR>


" Backspace takes you back in normal mode


" === vimwiki ===



" home key takes you to your index file
" This might not work if your home key isnt recognized
"noremap <Home> \ww
nmap <C-h> \ww

"terminal
tmap <c-`> <c-\><c-n>:

"new
"command
