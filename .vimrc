set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'SuperTab-continued.'
Bundle 'vim-jsbeautify'
"Bundle 'skyisle/hangeul.vim'
Bundle 'vim-scripts/python.vim'
Bundle 'tfnico/vim-gradle'
Bundle 'alderz/smali-vim'
Bundle 'tpope/vim-markdown'
Bundle 'majutsushi/tagbar'
Bundle 'junegunn/seoul256.vim'

" Enable pathogen bundle loader
"call pathogen#infect()
" Recognize file types / set indent mode
filetype plugin indent on

" Make color terminal : This is only for old unix systems. e.g)SunOS, HP-UX,
" if has ("unix")
"   set t_Co=8
"   if has ("terminfo")
"     set t_AFet t_ABe
"     set t_Sfet t_Sbet nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent    " always set autoindenting on

set nobackup    " do not keep a backup file, use versions instead
set history=50    " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set laststatus=2    " Always include a status line, which shows filename,
                    " displayes [+] if file's been modified

set titlestring=%F\ %m\ %r\ %* " Display full path on the window title bar.
set stl=%<%f\ %h%m%r%=0x%B\ %-10.((col:%c,line:%l)\ %L\ Lines%) " Status line

set fileformat=unix
" set foldcolumn=2

" Search options
set hlsearch
set ignorecase
set incsearch

" Insert 4 spaces instead of tab.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

syntax on

" Keep buffer of 3 lines at each end of screen: top and bottom.
" set scrolloff=3

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-kr


" Making vim load c file plugin under the directory of filetye plugin
filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

autocmd FileType Makefile                  setlocal noexpandtab
autocmd BufNewFile,BufRead *.i             setf c
autocmd BufNewFile,BufRead *.sc            setf c
autocmd BufNewFile,BufRead *.th,*.tc,*.ts  setf ruby
autocmd BufNewFile,BufRead *.re            setf lex
autocmd BufNewFile,BufRead *.ly            setf yacc

" Don't use Ex mode, use Q for formatting
map Q gq
" map K k

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

nnoremap <silent> <C-F2> :tp<cr>            " Go to previous tag
nnoremap <silent> <C-F3> :tn<cr>            " Go to next tag
nnoremap <silent> <F2>   :cp<cr>            " Go to previous error line (compile result)
nnoremap <silent> <F3>   :cn<cr>            " Go to next error line (compile result)
nnoremap <silent> <S-F2> :cold<cr>          " Go to older quickfix window
nnoremap <silent> <S-F3> :cnew<cr>          " Go to newer quickfix window

noremap <F9> :Rgrep<CR>
noremap <F8> <ESC>:!maketags

" Split window into two vertical widows.
" Each of them are of 80 column width and of 68 lines height.
map <F7> <esc>:set columns=165<CR>:vs<CR=:set lines=68<CR>

" Removing trailing white spaces
nnoremap <F6> :%s/\s\+$//g<CR>

" Scroll screen by 3 lines. Upwards, downwards.
noremap           <C-U> 3<C-U>
noremap           <C-D> 3<C-D>

" Scroll screen without moving cursor. In insert mode.
inoremap          <C-E> <C-O><C-E>
inoremap          <C-Y> <C-O><C-Y>

" Making Ctrl-BS to erase a word before.
map! <C-BS> <C-W>

" Note that grep's options are set by env variable GREP_OPTIONS
let Grep_Path = '/usr/local/bin/grep'
let Grep_OpenQuickfixWindow = 1
let Grep_Default_Options = '-rn'

" Suppress beeping and flashing screen
if $OS_NAME == "osx"
    set vb " macvim beeps unless this option is set
    set noeb
else
    set vb t_vb=
    set novb " gvim flashes screen without this option
    set noeb
endif

" Decorate doxygen comment.
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1

set path+=.,/usr/include/,/usr/local/include,./include


" Useful stuffs though not being used.
"
" Mark trailing white space red. Applys only to c and cpp files.
"
" autocmd FileType c,cpp  highlight WhitespaceEOL ctermbg=red guibg=red
" autocmd FileType c,cpp  match WhitespaceEOL /\s\+$/

" Mark TAB character green.
"
" highlight WhitespaceTAB ctermbg=lightgreen guibg=lightgreen
" match WhitespaceTAB /\t\+/

set imactivatekey=S-space

" Because MacVim has its own color scheme,
" it does not display my own color scheme.
" This line keep MacVim from applying its own color scheme.
colorscheme default

" ------------------------------------------------------------------------------
" Key bindings
" ------------------------------------------------------------------------------
" Make , the leader key
let mapleader = ","

" Edit user .vimrc
nmap <Leader>v :e ~/.vimrc<CR>

nmap <F8> :TagbarToggle<CR> 

" ------------------------------------------------------------------------------
" File type specifics *
" ------------------------------------------------------------------------------
" Execute current file with node.js
autocmd BufEnter *.js nmap <Leader><Leader> :w<CR>:!node %:p<CR>
" Execute current file with coffee-script node.js
autocmd BufEnter *.coffee nmap <Leader><Leader> :w<CR>:!coffee %:p<CR>

" Recognise file by extension
autocmd BufEnter *.ctp set filetype=php
autocmd BufEnter *.less set filetype=less
autocmd BufEnter *.ds set filetype=javascript
autocmd BufEnter *.json set filetype=javascript
autocmd BufEnter *.isml set filetype=html
autocmd BufEnter *.ejs set filetype=html

" JavaScript (tabs = 2, lines = 79)
autocmd FileType javascript set sw=2 ts=2 sts=2
" autocmd FileType javascript set tw=79

" CoffeeScript (tabs = 2, lines = 79)
autocmd FileType coffee set sw=2 ts=2 sts=2


autocmd FileType python set sw=4 ts=4 sts=4
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

au BufNewFile,BufRead *.gradle setf groovy
autocmd FileType groovy set sw=2 ts=2 sts=2

"Map NERDTree to \p
nmap <silent> <Leader>p :NERDTreeToggle<CR>
highlight Pmenu ctermbg=238 gui=bold

let hangeul_enabled = 1

" Indent Python in the Google way.
autocmd FileType python setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
" end of 'Indent Python in the Google way.'

command Thtml set ft=html | execute "%!tidy -q -i -html"

set rtp+=$GOROOT/misc/vim
au BufRead,BufNewFile *.go set filetype=go

colo seoul256
