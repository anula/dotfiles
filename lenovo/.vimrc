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

" Latex
Plugin 'lervag/vimtex'

" HTML
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ===== General stuff =====
set number
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
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = "fancy"

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.aux$', '\.log$', '\.out$', '\.pdf$', '\.thm$', '\.toc$', '\.bbl$', '\.blg$', '\.fls$', '\.bcf$', '\_latexmk$', '\.run.xml$', '\.synctex.gz$']

" HTML
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ===== Latex =====
let g:Tex_IgnoredWarnings = 'Wrong length of dash may have been used.'.'\n'
let g:Tex_DefaultTargetFormat='pdf'
au BufNewFile,BufRead *.tex
    \ set textwidth=80 |
    \ set colorcolumn=81 |
    \ set spell

" ===== C++ =====
au BufNewFile,BufRead *.cpp set syntax=cpp11

" clang format
autocmd Filetype cpp map <C-K> :ClangFormat<cr>
autocmd Filetype cpp imap <C-K> <c-o>:ClangFormat<cr>

" YCM
map <leader>g :YcmCompleter GoToDeclaration<cr>
map <leader>d :YcmCompleter GoToDefinition<cr>
map <leader>b :b#<cr>
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_server_python_interpreter='/usr/bin/python3'


" ===== Assembly =====
au BufNewFile,BufRead *.asm set syntax=nasm


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

" Vim Markdown options
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toc_autofit = 1

" ======== Rust ==========
let g:ycm_rust_src_path = $RUST_SRC_PATH

" rustfmt
autocmd Filetype rust map <C-K> :RustFmt<cr>
autocmd Filetype rust imap <C-K> <c-o>:RustFmtRange<cr>

au BufNewFile,BufRead *.rs
            \ set colorcolumn=100 |
