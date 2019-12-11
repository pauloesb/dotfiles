"""
""" CREDITS: @mislav @amix @garybernhardt
"""

""" General Settings
set modelines=0
set nomodeline
set nocompatible
set fileencoding=utf-8
set spelllang=en_us

if has("unix")
  let s:uname = system("uname -s")
  if s:uname != "Darwin\n"
    " Disable copy-as-rtf on non-Macs
    let g:loaded_copy_as_rtf = 1
  endif
endif

" plugins
call plug#begin('~/.vim/bundle')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'chriskempson/base16-vim'
Plug 'csexton/trailertrash.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'jamessan/vim-gnupg'
Plug 'janko-m/vim-test'
Plug 'kana/vim-textobj-user'
Plug 'lifepillar/vim-mucomplete'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathangrigg/vim-beancount'
Plug 'nelstrom/vim-qargs'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'nsf/gocode', { 'rtp': 'vim' }
Plug 'othree/html5.vim'
Plug 'robertmeta/nofrils'
Plug 'rosstimson/bats.vim'
Plug 'sjl/vitality.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-vinegar'
Plug 'matthewd/vim-vinegar', { 'branch': 'netrw-plug' }
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'wikitopian/hardmode'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

" fzf is installed via homebrew
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

" Enable filetype detection
filetype plugin indent on

" coding defaults (may be overridden by plugins/filetypes below)
syntax on
set expandtab
set backspace=start,indent,eol
set wrap
set shiftround

" turn off matching paren highlighting
let loaded_matchparen = 1

if has("gui_running")
  " don't need that ugly toolbar
  set guioptions-=T
  " always show tabs
  set showtabline=2
  set guifont=Inconsolata-g:h12
  set background=light
  colorscheme solarized-light
else
  " colorscheme base16-summerfruit-dark
  "
  " colorscheme github256
  "
  " let g:nofrils_heavylinenumbers=0
  " let g:nofrils_strbackgrounds=1
  " let g:nofrils_heavycomments=0
  " colorscheme nofrils-dark
  "
  " colorscheme base16-dracula
  "
  colorscheme darkblue
endif

" more info
set nonumber
set norelativenumber
set showmode
set showcmd
set ruler
set laststatus=2
set showtabline=2

" always keep the cursor line in the middle of the screen if possible
set scrolloff=999

" smart(ish) searching
set incsearch
set nohlsearch
set smartcase
set wrapscan

" file & dir matching mode
set wildmode=list:longest

" Make tab completion for files/buffers act like bash/readline
set wildmenu

" remove binary files from completion menus
set wildignore+=*.o,*.obj,*.class,*.png,*.jpg,*.jpeg,*.gif,*.ico,*.pdf,*.doc,*.docx,*.ppt,*.pptx,*.xls,*.xlsx,tags
set wildignore+=*vendor/cache/*,*/vendor/ruby/*,*/vendor/bundle/*,*/tmp/*,*/log/*,*/.chef/checksums/*,*/node_modules/*,public/assets*,_build/*
if has('wildignorecase')
  set wildignorecase
endif

" set complete-=i
set completeopt=menuone,preview,noinsert,noselect

set history=256

" shut up
set noerrorbells
set novisualbell
set t_vb=

" vim 8 (at least with my plugins) is very flakey
set writebackup
set nobackup
set swapfile

"When on a buffer becomes hidden when it is abandoned.
set hidden

" don't litter my working directory
set directory=~/.tmp,/var/tmp,/tmp

" auto-fetch changes from other sources
set autoread

" auto-write when suspending (^Z) etc
set autowrite

" i used to think folding > sliced bread
set nofoldenable

" Make sure the current window is always wide & tall enough
set winwidth=81
set equalalways

" use ag instead of grep
set grepprg=ag\ --smart-case\ --nogroup\ --nocolor

" eliminate clearing of terminal when suspending/quiting
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" more info
set list listchars=tab:▸\ ,extends:❯,precedes:❮
set showbreak=↪
set fillchars=vert:│,fold:─

" share the unnamed paste buffer with the system clipboard
set clipboard=unnamed

" it's the new standard
set tabstop=2 shiftwidth=2 softtabstop=2

" this makes more sense
set splitright
set splitbelow

" assume a fast terminal connection
set ttyfast
set ttimeout
set ttimeoutlen=100

" don't redraw each line when executing macros
set lazyredraw

" better behavior for the quickfix window and :sb
set switchbuf=useopen

" ask me if I want to write unsaved changes
set confirm

" I don't edit pure .sh files very often...
let g:is_bash=1

set shortmess+=AIc

" https://stackoverflow.com/questions/19030290/syntax-highlighting-causes-terrible-lag-in-vim/20519492#20519492
set regexpengine=1

""" Custom mappings

" prefer , rather than default \
let mapleader = ","

" Suspend in every mode
inoremap <C-z> <ESC>:suspend<CR>
cnoremap <C-z> <ESC>:suspend<CR>

" make split-window editing easier
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" keep selection after visual in/out-dent
vnoremap > >gv
vnoremap < <gv

" if I'm going to spend this much time tweaking I might as well make it as
" easy as possible
noremap <leader>ev :tabedit $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

" Toggle spell checking for the current file
noremap <leader>sc :setlocal spell!<cr>
" move to next misspelled word
noremap <leader>sn ]s
" move to previous misspelled word
noremap <leader>sp [s
" add word to dictionary
noremap <leader>sa zg
" show a list of alternate spellings
noremap <leader>s? z=

" Toggle paste mode for current file
noremap <leader>p :setlocal paste!<cr>

" visually select the last pasted hunk
nnoremap <leader>vp `[v`]

" use ctrl-n/p in normal mode to cycle through the quickfix list
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" dts inserts the current timestamp in insert mode
iab <expr> dts strftime("%Y-%m-%d %H:%M:%S %Z")

" <c-c> is not exactly equivalent to <esc> - make it so
noremap <c-c> <esc>
inoremap <c-c> <esc>

" make grep (ag) easier
noremap <leader>f :grep <C-R><C-W>

function! Cleanup()
  " save my current context
  let save_cursor = getpos(".")
  let old_query   = getreg('/')
  " use my tab/space setup on the whole file
  :retab
  " use my indentation setup on the whole file
  :normal gg=G
  " strip trailing whitespace
  :%s/\s\+$//e
  " remove any repeated blank lines
  :%s/\n\{3,}/\r\r/e
  " restore my original context
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>cu :silent call Cleanup()<CR>

noremap <leader>cs :SyntasticCheck<CR>

" move by display lines
nnoremap k gk
nnoremap j gj

" delete all buffers
nnoremap <leader>dd :bd *<c-a><cr>

" flying
nnoremap <leader>l :ls<cr>:b<space>

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>rn :call RenameFile()<cr>

function! Mkdir()
  let dir = expand('%:p:h')
  if !isdirectory(dir)
    call mkdir(dir, "p")
    echo "created directory: " . dir
  endif
endfunction

noremap <leader><leader> <c-^>

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
" inoremap <expr> <tab> InsertTabWrapper()
" inoremap <s-tab> <c-n>

" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>de :edit %%<cr>
map <leader>dv :vsplit %%<cr>
map <leader>ds :split %%<cr>

map <leader>et :tabedit config/locales/pending-upload.yml

""" Autocomd/Filetype-specific settings

augroup dowhatimean
  autocmd!
  " if I try to write to a file in a directory that doesn't exist,
  " create it for me
  autocmd BufWritePre * call Mkdir()
augroup END

augroup textmarkdown
  autocmd!
  autocmd BufRead,BufNewFile *.md,*.mkd,*.md.txt,*.md.gpg setfiletype markdown
  autocmd BufRead,BufNewFile *.txt setfiletype text
  autocmd FileType text,markdown setlocal wrap linebreak autoindent nolist textwidth=80 complete+=kspell
augroup END

augroup help
  autocmd!
  autocmd FileType help setlocal nospell
  autocmd FileType help wincmd L
augroup END

augroup makefile
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup END

augroup rb
  autocmd!
  autocmd BufRead,BufNewFile Vagrantfile,Rakefile,Guardfile,Cheffile,Brewfile setfiletype ruby
  autocmd FileType ruby setlocal iskeyword+=!,?
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
augroup END

augroup java
  autocmd!
  " use ~/bin/jtest for small java programs
  autocmd BufRead,BufNewFile *.java set makeprg=jtest\ %
augroup END

augroup cccc
  autocmd!
  " a very simplified make for small c programs
  autocmd BufRead,BufNewFile *.h,*.c set makeprg=make\ %:r
augroup END

augroup gitconfig
  autocmd!
  autocmd BufRead,BufNewFile .gitconfig,gitconfig.symlink setlocal noexpandtab
augroup END

augroup sql
  autocmd!
  autocmd BufRead,BufNewFile */psql.edit.* setfiletype sql
  autocmd BufRead,BufNewFile */psql.edit.* silent :SQLSetType postgresql
  autocmd BufRead,BufNewFile */.sql setfiletype sql
augroup END

augroup rust
  autocmd!
  autocmd BufRead,BufNewFile *.rs setfiletype rust
augroup END

augroup mail
  autocmd!
  autocmd FileType mail setlocal wrap linebreak autoindent nolist textwidth=72 spell
  autocmd FileType mail setlocal complete+=kspell
  autocmd FileType mail silent :Trim
augroup END

augroup git
  autocmd!
  autocmd FileType gitcommit setlocal nospell complete+=kspell
augroup END

augroup cukes
  autocmd!
  autocmd FileType cucumber setlocal wrap linebreak nolist textwidth=80 spell
augroup END

augroup curly
  autocmd!
  autocmd BufNewFile,BufRead *.curly set filetype=html.mustache syntax=mustache
augroup END

augroup tabby
  autocmd!
  autocmd BufRead,BufNewFile *.tsv setlocal noexpandtab
augroup END

augroup emmet
  autocmd!
  autocmd FileType html,css,scss,eruby,html.mustache :EmmetInstall
  autocmd FileType html,eruby,html.mustache imap <buffer> <C-e> <C-y>,
augroup END

" Save when losing focus
autocmd FocusLost * :silent! wall

" Restore last cursor position
augroup cpos
  autocmd!
  autocmd BufReadPost *
        \ if &filetype !~ '^git\c' && line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

" put results of :grep in quickfix window
augroup qfgrep
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

augroup golang
  autocmd!
  autocmd FileType go setlocal noexpandtab nolist
  autocmd FileType go compiler go
augroup END

" Resize splits when the window is resized
augroup resize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" Enable omni completion.
augroup compl
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END

augroup activewindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline colorcolumn=80 signcolumn=yes number relativenumber
  " autocmd VimEnter,WinEnter,BufWinEnter * setlocal signcolumn=yes
  " autocmd WinLeave * setlocal signcolumn=no
  autocmd WinLeave * setlocal nocursorline signcolumn=no colorcolumn=0 nonumber norelativenumber
augroup END

augroup journal
  autocmd!
  autocmd BufWinEnter */journal.md.pgp call PrependDateHeader()
augroup END

augroup javascript
  autocmd!
augroup END

function! PrependDateHeader()
  let format = '+%Y-%m-%d %H:%M%n'
  let cmd = 'date ' . shellescape(format)
  let result = substitute(system(cmd), '[\]\|[[:cntrl:]]', '', 'g')
  call append(0, '## ' . result)
  :normal ggo
  :normal gg2o
endfunction

iabbr fundrasier fundraiser
iabbr ayden adyen

" rails.vim settings
"
" open the 'alternate' (test) files
noremap <leader>as :AS<CR>
noremap <leader>av :AV<CR>
" open the 'related' (template/presenter) files
noremap <leader>rs :RS<CR>
noremap <leader>rv :RV<CR>

" Map keys to go to specific files
noremap <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
noremap <leader>rr :silent call ShowRoutes()<cr>
noremap <leader>gg :topleft 100 :split Gemfile<cr>

" needed for textobj-user & textobj-rubyblock
runtime macros/matchit.vim

" Vimux should only open a pane when there isn't one already
let g:VimuxUseNearestPane = 1

" The keys sent to the runner pane before running a command. By default it sends
" `q` to make sure the pane is not in scroll-mode and `C-u` to clear the line.
let g:VimuxResetSequence = 'q clear C-u'

" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>rl :VimuxRunLastCommand<CR>

" Run makeprog (via Dispatch) in the same way as vimux
map <Leader>rm :Dispatch<CR>

" Gist.vim
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" delimitMate
let delimitMate_expand_cr = 1

" Tabularize
"  NOTES:
"  * \zs is basically a zero-width lookbehind assertion;
"    it eats spaces before the comma/colon/whatever.
"    See: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
"  * l0c1 is a format specifier that says
"    "left, then zero spaces, then [delimiter], then 1 space"
"    See: https://raw.github.com/godlygeek/tabular/master/doc/Tabular.txt
noremap <leader>a# :Tabularize/#<CR>
vnoremap <leader>a# :Tabularize/#<CR>
noremap <leader>ah :Tabularize/=><CR>
vnoremap <leader>ah :Tabularize/=><CR>
" noremap <leader>a= :Tabularize/=<CR>
" vnoremap <leader>a= :Tabularize/=<CR>
noremap <leader>a: :Tabularize/:\zs/l0c1<CR>
vnoremap <leader>a: :Tabularize/:\zs/l0c1<CR>
" noremap <leader>a, :Tabularize/,\zs/l0c1<CR>
" vnoremap <leader>a, :Tabularize/,\zs/l0c1<CR>

" always
let g:vitality_always_assume_iterm = 1

" don't be crazy
let g:vim_json_syntax_conceal = 0

" vim-test
let g:test#strategy = 'dispatch'
nmap <silent> <leader>rt :TestFile<CR>
nmap <silent> <leader>rT :TestNearest<CR>
nmap <silent> <leader>ra :TestSuite<CR>

" vim-markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'bash=sh', 'sh']

" fzf
let g:fzf_action = {
      \ 'ctrl-m': 'e',
      \ 'ctrl-t': 'tabedit',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
nnoremap <silent> <Leader>t :FZF<CR>

" ft_sql
let g:omni_sql_no_default_maps = 1

" vim-go
let g:go_fmt_command = "goimports"

" vim-gnupg
" let g:GPGDefaultRecipients = [ "" ]

" ALE
let g:ale_lint_on_enter = 0

" change cursor shape depending on mode in Terminal
let &t_SI="\033[4 q" " start insert mode
let &t_EI="\033[1 q" " end insert mode

" emmet.vim
let g:user_emmet_mode = 'i'

" mucomplete
let g:mucomplete#enable_auto_at_startup = 0
let g:mucomplete#smart_enter = 0
let g:mucomplete#no_popup_mappings = 1
imap <c-y> <plug>(MUcompletePopupAccept)
imap <c-d> <plug>(MUcompleteCR)

" ESLint
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Asyncrun
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
