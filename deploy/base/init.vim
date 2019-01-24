" Indent configuration
autocmd BufRead neomutt-* setf mail
autocmd BufRead *.tsx setf typescript
autocmd BufRead *.md setf markdown
autocmd FileType bash,zsh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType c,cpp setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType css,html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType elm setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=2 sts=2 sw=2 noexpandtab list
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 re=1 expandtab
autocmd FileType sql setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType crystal setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab

" Default indent config
set ts=2 sts=2 sw=2 expandtab

" Disable folds to avoid slowness
set foldmethod=manual

" Automatically expand tabs into spaces
set expandtab

" Keep our buffers open, even if we are not seeing them.
set hidden
set switchbuf=useopen

" Disable wrap
set nowrap

" Disable visual bell
set visualbell t_vb=

set number


" Configure our completion mode
set wildmode=longest:full,full

call plug#begin('~/.config/nvim/plugged')
  " Colorschemes
  Plug 'dracula/vim'
  Plug 'chriskempson/base16-vim'

  " Language Support
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
  Plug 'rust-lang/rust.vim', {'for': 'rust'}
  Plug 'cespare/vim-toml'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'HerringtonDarkholme/yats.vim'
  "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  let g:go_version_warning=0

  " Completion
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2'
  Plug 'ncm2/ncm2-cssomni' " CSS
  Plug 'ncm2/ncm2-vim' " VIML
  Plug 'Shougo/neco-vim' " Ncm depends on it for vim completion
  Plug 'ncm2/ncm2-go' " Golang
  Plug 'yuki-ycino/ncm2-dictionary' " Dictionary completion
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh' } " Typescript
  Plug 'ncm2/ncm2-bufword' " words on buffer
  Plug 'ncm2/ncm2-path' " file path
  Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax' " Syntax-based completion
  Plug 'ncm2/ncm2-cssomni' " CSS
  Plug 'ncm2/ncm2-markdown-subscope' " Code blocks on markdown

  " Text handling plugins
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-abolish'
  Plug 'scrooloose/nerdcommenter'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'terryma/vim-multiple-cursors'

  " Input plugins
  Plug 'Raimondi/delimitMate'
  Plug 'houtsnip/vim-emacscommandline'
  Plug 'tpope/vim-endwise'
  Plug 'lilydjwg/colorizer'

  " Language Server Support
  "Plug 'Shougo/denite.nvim'
  "Plug 'Shougo/echodoc.vim'
  "Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'make release'}
  "let g:LanguageClient_autoStart = 1
  "let g:LanguageClient_serverCommands = {
  "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  "\ 'go': ['go-langserver'],
  "\ 'typescript': ['javascript-typescript-stdio'],
  "\ 'tsx': ['javascript-typescript-stdio'],
  "\ 'typescript.tsx': ['javascript-typescript-stdio'],
  "\ 'javascript': ['javascript-typescript-stdio'],
  "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
  "\ }

  " Environment plugins
  Plug 'jlanzarotta/bufexplorer'
  Plug 'tpope/vim-vinegar'
  Plug 'DataWraith/auto_mkdir'
  Plug 'tpope/vim-fugitive'
  Plug 'majutsushi/tagbar'

  Plug 'vimwiki/vimwiki', {'branch': 'dev'}
  let g:vimwiki_list = [{ 'path': '~/Documents/docs', 'path_html': '~/Documents/output', 'ext': '.md', 'syntax': 'markdown' }]

  " CtrlP
  Plug 'ctrlpvim/ctrlp.vim'
  "Plug 'nixprime/cpsm'
  let g:ctrlp_user_command = 'rg --files --color=never %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = ''
  "let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

  Plug 'kassio/neoterm'
  let g:neoterm_default_mod = "vertical belowright"
  let g:neoterm_shell = "zsh"
  let g:neoterm_automap_keys = ",ss"

  if empty($SSH_CONNECTION)
    let g:neoterm_fixedsize = "1"
    let g:neoterm_size = "112"
    let g:neoterm_default_mod = "vertical belowright"

    set splitbelow
    set splitright
  else
    let g:neoterm_default_mod = "belowright"
  endif
  let g:neoterm_autoscroll = "1"

  Plug 'sbdchd/neoformat'

  let g:neoformat_enabled_javascript = ['js-beautify']
  let g:neoformat_enabled_ruby = []
  augroup fmt_lints
    autocmd!
    autocmd BufWritePre * Neoformat
  augroup END
call plug#end()

" Set python paths for faster lookup
let g:python_host_prog = "/usr/bin/python2"
let g:python2_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

" Plugin configuration
" =============================================================================
" Here we add all configuration for our plugins that need them to be
" enabled before they can be called.
" =============================================================================

" Set our terminal background to dark
set background=dark

if isdirectory($HOME . "/.config/nvim/autoload")
  "if &t_Co < 256 && !has("gui_running")
    "set bg=dark
    colorscheme dracula
  "else
    " Tmux fixes
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    "colorscheme dracula
  "endif
endif

" Completion configuration
set shortmess+=c " Remove completion-menu messages
inoremap <c-c> <ESC>
noremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

au BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Keymaps
" =============================================================================
" Usually we're going to follow some conventions:
"   - If a command opens a new pane/buffer, we're going to give it a PRIMARY,
"     and that PRIMARY can be repeated or added a MODIFIER.
"
"     Our MODIFIERS are always the same:
"       * `s` for opening in a vertical split
"       * `S` for opening in a horizontal split
"       * `t` for opening in a new tab
"
"     Our PRIMARIES are defined in a command by command basis.
" =============================================================================

" Map our leader key to `,`
let g:mapleader=","

" Clean up search results
nnoremap <c-l> :nohlsearch<cr>

" Map window movement commands to terminal buffers
tnoremap <c-w>j <c-\><c-n><c-w>j
tnoremap <c-w>k <c-\><c-n><c-w>k
tnoremap <c-w>h <c-\><c-n><c-w>h
tnoremap <c-w>l <c-\><c-n><c-w>l
tnoremap <c-w>J <c-\><c-n><c-w>J
tnoremap <c-w>K <c-\><c-n><c-w>K
tnoremap <c-w>H <c-\><c-n><c-w>H
tnoremap <c-w>L <c-\><c-n><c-w>L
tnoremap <c-w>x <c-\><c-n><c-w>x

" Wiki Diary
nnoremap <silent> <leader>wd :VimwikiMakeDiaryNote<cr>

" Format the file
nnoremap <silent> <leader>ff :Neoformat<cr>:e<cr>

" Remove trailing whitespaces
nnoremap <silent> <leader><space> :FixWhitespace<cr>

" a.vim
nnoremap <silent> <leader>aa :A<cr>
nnoremap <silent> <leader>as :AV<cr>
nnoremap <silent> <leader>aS :AS<cr>

" fzf.vim - fuzzy file finder
nnoremap <silent> <leader>tt :CtrlP<cr>

" bufexplorer.vim
nnoremap <silent> <leader>bb :CtrlPBuffer<cr>

" tagbar.vim - tag listing
nnoremap <silent> <leader>yy :TagbarToggle<cr>

" Commands for LanguageClient
nnoremap <F5> :call LanguageClient_contextMenu()<cr>
nnoremap K :call LanguageClient#textDocument_hover()<cr>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>rr :call LanguageClient#textDocument_rename()<cr>

" neoterm.vim - integrated terminal
nnoremap <silent> <leader>sk :Tkill<cr>
