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

" Syntax highlighting
Plugin 'sheerun/vim-polyglot'

" Files
Plugin 'scrooloose/nerdTree'
Plugin 'kien/ctrlp.vim'

" Git
Plugin 'tpope/vim-fugitive'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Python stuff
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Latex
Plugin 'lervag/vimtex'

" HTML
Plugin 'mattn/emmet-vim'

" Surround
Plugin 'tpope/vim-surround'

" JavaScript
Plugin 'maksimr/vim-jsbeautify' " Settings in ~/.vim/.editorconfig

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

au BufNewFile,BufRead *.cpp set syntax=cpp11

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

" Syntastic language independent
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
autocmd Filetype cpp noremap <C-K> :ClangFormat<CR>
autocmd Filetype cpp noremap <C-F> :%ClangFormat<CR>
autocmd Filetype cpp inoremap <C-K> <C-O> :ClangFormat<CR>

" YCM
map <leader>g :YcmCompleter GoToDeclaration<cr>
map <leader>d :YcmCompleter GoToDefinition<cr>
map <leader>b :b#<cr>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_max_diagnostics_to_display = 0

" YCM clangd
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")


" ===== Assembly =====
au BufNewFile,BufRead *.asm set syntax=nasm

" ===== JavaScript et al =====
" Format all.
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
 autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" Format range.
autocmd FileType javascript vnoremap <buffer>  <c-k> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-k> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-k> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-k> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-k> :call RangeCSSBeautify()<cr>

" For linting
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint'

au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80 |
    \ set background=dark

" ===== Python =====
au BufNewFile,BufRead *.py
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80 |
    \ set background=dark

" Two not 4 spaces for indent.
let g:autopep8_indent_size=2
" Use python3 for checks
let g:syntastic_python_python_exec = 'python3'

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
autocmd Filetype rust noremap <C-F> :RustFmt<cr>
autocmd Filetype rust noremap <C-K> :RustFmtRange<cr>

au BufNewFile,BufRead *.rs
            \ set colorcolumn=100 |
