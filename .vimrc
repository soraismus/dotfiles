execute pathogen#infect()
syntax on
filetype plugin indent on

command Preview :!nohup firefox % &<CR>

let mapleader = ","

" Options {{{1
" -------------

set autoread
set autowrite
set colorcolumn=80,115
set dictionary+=/usr/share/dict/words
set encoding=utf-8
set expandtab
set foldmethod=marker
set foldopen+=jump
set incsearch
set linebreak
set number
set shiftwidth=2
set showbreak=↪   " \u21aa
set smarttab
set tabstop=2
set wildmenu
set wildmode=longest:full,full
" }}}1

" Plugin Settings {{{2
" ---------------------

let g:slime_target = "tmux"
let g:user_emmet_settings = { 'indentation' : '  ' }
" }}}1

" Mappings {{{1
" --------------

map <F9> :r! xclip -o<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

cmap w!! %!sudo tee > /dev/null %

nmap <Leader>v :e $MYVIMRC

omap . :normal T.vf.<CR>

inoremap jk <Esc>
inoremap kj <Esc>
inoremap <c-a> <Esc>I
inoremap <c-d> <c-r>=system('date')<cr>
inoremap <c-e> <Esc>A
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

nnoremap <c-p> :r! xclip -o<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
nnoremap <leader>l :setlocal number!<CR>
" }}}1

" Autocommands {{{1
" ------------------

augroup Miscellaneous " {{{2
  autocmd BufWinEnter * loadview
  autocmd BufWinLeave * mkview
  autocmd VimEnter    * loadview
  autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
augroup END
" }}}2

augroup FTCheck " {{{2
  autocmd!
  autocmd BufRead,BufNewFile *.cough setfiletype coughsyrup
  autocmd BufNewFile,BufRead *.txt,README if &ft == ""|set ft=text|endif
augroup END
" }}}2

augroup FTOptions " {{{2
  autocmd!
  autocmd FileType sh,zsh,csh,tcsh inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
  autocmd FileType sh,zsh,csh,tcsh let &l:path = substitute($PATH, ':', ',', 'g')
  autocmd FileType python,ruby inoremap <silent> <buffer> <C-X>! #!/usr/bin/env<Space><C-R>=&ft<CR>
  autocmd FileType git setlocal foldmethod=syntax foldlevel=1
  autocmd FileType java let b:dispatch = 'javac %'
augroup END " }}}2
" }}}1
