" Douglas Black
" Colors
syntax enable           " enable syntax processing
set background=dark
colorscheme codedark
set encoding=UTF-8
"
" Misc {{{
set backspace=indent,eol,start
set path+=**
let g:vimwiki_list = [{'path': '~/.wiki/'}]
set clipboard=unnamed
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set relativenumber      " relative number
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
set colorcolumn=80
highlight ColorColumn ctermbg=233
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Line Shortcuts {{{
command W w !sudo tee "%" > /dev/null
command! T !ctags -R .
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}
" Leader Shortcuts {{{
let mapleader=','
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>l :call <SID>ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>af :Neoformat<CR>
tnoremap <Esc> <C-\><C-n>
map <Leader>a :NERDTreeToggle<CR>
map <Leader>n <esc>:tabprevious<CR>
nnoremap <leader>vt :vsplit term://.//27361:/usr/bin/zsh<CR>
inoremap <a-t> <esc>:vsplit term://.//27361:/usr/bin/zsh<CR>
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-l> <c-\><c-n><c-w>l
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
map <Leader>m <esc>:tabnext<CR>
map <Leader>tn <esc>:tabnew<CR>
map <Leader>tc <esc>:tabclose<CR>
map <Leader>to <esc>:tabonly<CR>
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vs <C-R>=expand("%:p:h") . "/" <CR>
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    " autocmd VimEnter * colorscheme codedark
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd BufEnter *.go setlocal noexpandtab
    autocmd BufEnter *.avsc setlocal ft=json
augroup END
" }}}
" {{{
if executable('fzf')
    nnoremap <C-p> :FZF<cr>
endif
" }}}
" Testing {{{
let test#trategy = 'neovim'
let test#python#runner = 'nose'
" }}}
" Vim Plug {{{
call plug#begin()
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'SirVer/ultisnips'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'vim-airline/vim-airline'
Plug 'pearofducks/ansible-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'davidhalter/jedi-vim'
Plug 'janko-m/vim-test'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'moll/vim-node'
Plug 'neomake/neomake'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'ervandew/supertab'
Plug 'lambdalisue/suda.vim'
Plug 'sbdchd/neoformat'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'

call plug#end()
" }}}
" airline {{{
set laststatus=2
let g:airline_theme = 'codedark'
let g:airline_left_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:deoplete#enable_at_startup = 1
" }}}
" ultisnips {{{
let g:UltiSnipsExpandTrigger='<c-/>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
" }}}
" neomake {{{
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

let g:neomake_list_height = 4
let g:neomake_open_list = 1
let g:neomake_error_sign = {
         \ 'text': '✖',
         \ 'texthl': 'NeomakeErrorSign',
         \ }
     let g:neomake_warning_sign = {
         \   'text': '‼',
         \   'texthl': 'NeomakeWarningSign',
         \ }
     let g:neomake_message_sign = {
          \   'text': '➤',
          \   'texthl': 'NeomakeMessageSign',
          \ }
     let g:neomake_info_sign = {
          \ 'text': 'ℹ',
          \ 'texthl': 'NeomakeInfoSign'
          \ }

let g:neomake_highlight_lines = 1
let g:airline#extensions#neomake#enabled = 1

" }}}
" Neoformat {{{
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" }}}
" Custom Functions {{{
function! <SID>ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line('.')
    let c = col('.')
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunc

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line('.')
    let c = col('.')
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunc

function! <SID>RunFile()
    let ext = expand('%:e')
    if(ext == 'go')
        :GoRun
    endif
endfunc

function! <SID>BuildFile()
    let ext = expand('%:e')
    if(ext == 'go')
        :GoBuild
    endif
endfunc
" }}}
" vim:foldmethod=marker:foldlevel=0
