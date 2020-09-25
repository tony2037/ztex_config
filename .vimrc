"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
" " alternatively, pass a path where Vundle should install plugins
" "let path = '~/some/path/here'
" "call vundle#rc(path)
"
" " let Vundle manage Vundle, required
"Plugin 'gmarik/vundle'

" -- Plugins --- "

syntax enable
colorscheme monokai
" -- colorscheme --"
" colorscheme codedark
" colorscheme tender
" colorscheme Molokai


" -- python-syntax -- "
let g:python_highlight_all=1


" -- html5.vim  -- "
let g:html_indent_inctags='html,head,body'


" -- tcomment_vim -- "
vmap <Tab> gc


" -- gitgutter -- "
let g:gitgutter_diff_base='HEAD'
let g:gitgutter_sign_allow_clobber = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
nnoremap <Tab><Down> :GitGutterNextHunk<CR>
nnoremap <Tab><Up> :GitGutterPrevHunk<CR>
nnoremap <Tab><Right> :GitGutterPreviewHunk<CR>
nnoremap <Tab><Left> :pclose<CR>


" -- NERDTree -- "
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" -- indentLine -- "
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'


" -- lightline -- "
let g:lightline = { 'colorscheme': 'wombat'}
set nocompatible
set noshowmode   "to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command
set laststatus=2


" -- posva/vim-vue -- "
let g:vue_pre_processors = ['pug', 'sass']


" -- coc.nvim -- "
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" --- Norml Setting --- "
filetype plugin indent on
syntax on
set t_Co=256
set incsearch
set hlsearch
set modeline
set modelines=2
set nofoldenable
set nowrap
set number
set ruler
set updatetime=100
set backspace=indent,eol,start " allow backspacing over everything in insert mode on MacOS

" --- Set shiftwidth and softtabstop --- "
autocmd FileType yaml,html,css,javascript,ls,vue setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType vue,javascript,json             setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType perl,python,java,c,cuda,cpp,php setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType sh,make setlocal shiftwidth=4 tabstop=4
autocmd BufNewFile *.h   setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType json let g:indentLine_conceallevel = 0

" --- Open new file with template --- "
autocmd BufNewFile *.sh exec ":call append(0, '#!/bin/bash')"
autocmd BufWritePost *.py,*.sh silent ! chmod a+x %
" autocmd BufNewFile *.c silent! 0r $HOME/.vim/template/tmpl.c | 7delete | 3

nnoremap \| <C-W>\|
nnoremap <C-C> <C-A>
nnoremap tt :TagbarToggle<CR>
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
command W w
command Q q
command Wq wq
command WQ wq
command CopyModeOn set nonumber wrap
command CopyModeOff set number nowrap
command PasteModeOn set paste
command PasteModeOff set nopaste

set expandtab
set shiftwidth=4
set autoindent
set smartindent

set cscopetag
set csto=0

if filereadable("cscope.out")
   cs add cscope.out   
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
set cscopeverbose

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
