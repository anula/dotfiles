# Created using:
# (Java): http://www.lucianofiandesio.com/vim-configuration-for-happy-java-coding
# (Ant): http://blog.vinceliu.com/2007/08/vim-tips-for-java-1-build-java-files.html
sudo apt-get install ant vim openjdk-7-jdk openjdk-7-jre git build-essential cmake python-dev xclip postgresql subversion

git config --global core.editor "vim"
echo "
export VISUAL=vim
export EDITOR=\"$VISUAL\"
" >> ~/.bashrc

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "set nocompatible              \" be iMproved, required
filetype off                  \" required

\" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

\" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

\" The following are examples of different formats supported.
\" Keep Plugin commands between vundle#begin/end.
\" plugin on GitHub repo
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
\" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'javacomplete'
\" Git plugin not hosted on GitHub
\"Plugin 'git://git.wincent.com/command-t.git'
\" git repos on your local machine (i.e. when working on your own plugin)
\"Plugin 'file:///home/gmarik/path/to/plugin'
\" The sparkup vim script is in a subdirectory of this repo called vim.
\" Pass the path to set the runtimepath properly.
\"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
\" Avoid a name conflict with L9
\"Plugin 'user/L9', {'name': 'newL9'}

\" All of your Plugins must be added before the following line
call vundle#end()            \" required
filetype plugin indent on    \" required
\" To ignore plugin indent changes, instead use:
\"filetype plugin on
\"
\" Brief help
\" :PluginList       - lists configured plugins
\" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
\" :PluginSearch foo - searches for foo; append `!` to refresh local cache
\" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
\"
\" see :h vundle for more details or wiki for FAQ
\" Put your non-Plugin stuff after this line

set number
syntax on

set history=100000

set number

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hlsearch

set colorcolumn=81

\" http://blog.vinceliu.com/2007/08/vim-tips-for-java-1-build-java-files.html
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
autocmd BufRead set makeprg=ant\ -find\ build.xml

\" trailing whitespaces
command StripWhitespaces :%s/\s\+$//e
" > ~/.vimrc
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py
