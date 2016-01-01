" ==============================vundle===================================== "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdtree'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
" ========================================================================== "

" ==============================miscs===================================== "
" make source code looks more colorfull, it will call <filetype on>
syntax on
" list number at the left side
set number
" let mouse rock and roll
set mouse=a
" ========================================================================== "

" ===============================taglist==================================== "
let Tlist_Show_One_File = 1            	" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          	" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         	" 在右侧窗口中显示taglist窗口
let Tlist_Auto_Open = 1					" 启动vim后，自动打开taglist窗口

map <silent> <F9> :TlistToggle<cr>		" 使用<F9>键就可以打开/关闭taglist窗口
" ========================================================================== "

" ===============================NERDTree==================================== "
autocmd VimEnter * NERDTree 			" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" fix E121: Undefined variable: g:NERDTreeDirArrowCollapsible Error
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

map <silent> <F2> :NERDTreeToggle<cr>	" 按下 F2 调出/隐藏 NERDTree
" ========================================================================== "






