set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'

Plugin 'rust-lang/rust.vim'

" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

" Files
Plugin 'scrooloose/nerdTree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'

" Git
Plugin 'tpope/vim-fugitive'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Python stuff
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'

" Latex
Plugin 'lervag/vimtex'

Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

set history=1000

set number

au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.tex set filetype=tex

set autoindent
"set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hlsearch

set colorcolumn=81
set encoding=utf-8

" remove trailing whitespaces
command! StripWhitespaces :%s/\s\+$//e
" and highlight them
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" colorscheme
syntax enable
"colorscheme zenburn
colorscheme solarized
let g:solarized_termcolors=256
set background=dark

" Powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = "fancy"


" ===== C++ =====
au BufNewFile,BufRead *.cpp set syntax=cpp11

" Clang format
autocmd FileType cpp,cpp11 map <C-K> :RustFmt<cr>
autocmd FileType cpp,cpp11 map imap <C-K> <c-o>:RustFmt<cr>

" go to definition
map <leader>g :YcmCompleter GoToDeclaration<cr>
map <leader>d :YcmCompleter GoToDefinition<cr>
map <leader>b :b#<cr>
let g:ycm_autoclose_preview_window_after_completion=1


" ===== Assembly =====
au BufNewFile,BufRead *.asm set syntax=nasm


let g:ycm_rust_src_path = '/home/tari/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
" ===== Python =====
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80 |
    \ set background=dark

" virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
""  exec(open(activate_this).read())
"EOF

let python_highlight_all=1
syntax on


" ===== Pascal =====
if (1==1) "change to "1==0" to use original syntax
  au BufNewFile,BufRead *.pas,*.PAS   set ft=delphi
else
  au BufNewFile,BufRead *.pas,*.PAS set ft=pascal
endif

let g:ycm_server_python_interpreter = '/usr/bin/python'

" Vim Markdown options
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toc_autofit = 1

let vim_markdown_preview_github=1

let g:rustfmt_autosave = 0
" Rust format
autocmd FileType rust map <C-K> :RustFmt<cr>
autocmd FileType rust imap <C-K> <c-o>:RustFmtRange<cr>

" For vimtex
let g:vimtex_disable_version_warning = 1
let g:vimtex_echo_ignore_wait = 1
set linebreak
