" 13 October 2013
inoremap jk <Esc>
set number
execute pathogen#infect()
syntax on
filetype plugin indent on

" 14 October 2013
" must be one line
" use '\' for continuation
" '\' auto-indents, however
let g:user_emmet_settings = { 'indentation' : '  ' }

" 15 October 2013
map <F9> :r! xclip -o<CR>
nmap <Leader>v :e $MYVIMRC
command Preview :!nohup firefox % &<CR>

" 21 October 2013
set expandtab
set tabstop=2
set shiftwidth=2
nnoremap <C-P> :r! xclip -o<CR>

" 29 October 2013
" StackOverflow user jefflunt suggests setting leader to the spacebar.
let mapleader = ","
syntax on
set encoding=utf-8
" set spell spellang=en_us

" 5 November 2013
cmap w!! %!sudo tee > /dev/null %

" 27 November 2013
" inoremap <c-w> jkdawi
" inoremap <c-u> <c-r>.<cr>
inoremap <c-a> <Esc>I
inoremap <c-e> <Esc>A

" Sat Nov 30 10:08:33 EST 2013
inoremap <c-d> <c-r>=system('date')<cr>

" Sun Dec  8 13:06:05 EST 2013
" ↪ character is pasted by the key sequence <CTRL-V>u21aa
set showbreak=↪

" Mon Dec  9 13:05:09 EST 2013
nnoremap <F5> :GundoToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
set splitright
set splitbelow

" Tue Dec 17 15:36:08 EST 2013
inoremap kj <Esc>

" Sun Dec 22 15:40:11 EST 2013
" vnoremap . :normal T.vf.
" omap . :normal v.<CR>
omap . :normal T.vf.<CR>

" Fri Dec 27 15:18:51 EST 2013
let g:slime_target = "tmux"

" Tue Dec 31 01:15:27 EST 2013
" `BufWinLeave` and `BufWinEnter` and `BufWinLeave` cause errors:
" `Error detected when processing BufWinEnter Auto commands for '*': E32: No file name`
" au BufWinLeave * mkview
" au BufWinEnter * loadview
au VimEnter * loadview

" Mon Jan  6 12:28:27 EST 2014
cnoremap aa norm @a<CR>
cnoremap bb norm@b<CR>

" Mon Jan 20 18:41:02 EST 2014
" set foldmethod=syntax
" set foldlevelstart=1
" let javaScript_fold=1

" Wed Feb  5 20:06:17 EST 2014
" Source = Peter Rincker from
" https://stackoverflow.com/questions/11858927/preventing-trailing-whitespace-when-using-vim-abbreviations
func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc
iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
" The following should be temporary, as i
" only applies to coughsyrup files.
" The purpose of the line below is to allow cp<SPACE>f
" to represent \u2022f. The bullet point (\u2022) is
" the composition operator in CoughSyrup.
" \m represent 'magic'.
" iabbr <silent> cp <C-V>u2022<C-R>=Eatchar('\m\s')

" Sat Feb  8 13:53:35 EST 2014
" let g:slime_target = "tmux"

" Mon Feb 10 11:27:28 EST 2014
" nnoremap <C-j> <C-w><C-j>
" nnoremap <C-k> <C-w><C-k>
" nnoremap <C-l> <C-w><C-l>
" nnoremap <C-h> <C-w><C-h>

" Tue Feb 11 12:49:09 EST 2014
" http://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher instead of grep
" if executable('ag')
" 	set grepprg=ag\ --nogroup\ --nocolor
" 	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" 	let g:ctrlp_use_caching = 0
" endif
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" nnoremap \ :Ag<SPACE>

" Mon Feb 24 14:13:38 EST 2014
set colorcolumn=80,115

" Tue May 13 13:18:08 EDT 2014
au BufRead,BufNewFile *.cough setfiletype coughsyrup

"Thu Sep 18 14:25:54 EDT 2014
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Wed Nov 12 19:25:56 EST 2014
nnoremap <leader>l :setlocal number!<CR>

" Tue Feb 10 16:24:44 EST 2015
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
