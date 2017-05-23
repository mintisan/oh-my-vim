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

Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'raimondi/delimitmate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'junegunn/vim-easy-align'
Plugin 'chiel92/vim-autoformat'
Plugin 'SirVer/ultisnips'
Plugin 'klen/python-mode'

" Plugin 'scrooloose/syntastic'
" Plugin 'valloric/youcompleteme'

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
" highlight current-selected line
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkgreen guifg=white
" highlight key words to be searched
set hlsearch
" highlight instantly
set incsearch
" set ctags path, it's default, in case modify it
set tags=./tags,tags
" incase can't delete in INSERT modee
set backspace=indent,eol,start
" set tab as 2 space, `:retab` to work on current buffer
set tabstop=2 softtabstop=0 expandtab shiftwidth=2
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source ./.vimrc
" leader is comma
let mapleader=","
" turn off search highlight, instead of `:nohlsearch`
nnoremap <leader><space> :nohlsearch<CR>
" 80th-column if you write code
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif
" ========================================================================== "


" ===============================tagbar==================================== "
autocmd VimEnter * nested :TagbarOpen  " 启动vim时自动打开tagbar
set updatetime=200 " 根据光标位置自动更新高亮tag的间隔时间，单位为毫秒
autocmd VimEnter * nested :call tagbar#autoopen(1) " 若文件类型支持，则自动打开tagbar
autocmd BufEnter * nested :call tagbar#autoopen(0) " 打开新标签时，自动打开tagbar
nmap <F8> :TagbarToggle<CR>
" ========================================================================== "

" ===============================ctags==================================== "
" do `ctags -R *` to generate `tags`
map <silent> <F4> :!ctags -R<CR>    " press F4 to re-build ctags
" ========================================================================== "


" ===============================cscope==================================== "
" do `cscope -Rbkq` to generate `cscope.out`
if filereadable("cscope.out")
  cs add cscope.out
endif
" ========================================================================== "


" ===============================NERDTree==================================== "
autocmd VimEnter * NERDTree       " 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" fix E121: Undefined variable: g:NERDTreeDirArrowCollapsible Error
let g:NERDTreeDirArrows           = 1
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly       = 1
" 不显示缓冲文件，中间文件
let NERDTreeIgnore=[ '.pyc$', '.pyo$', '.obj$', '.o$', '.so$', '.egg$', '^.git$', '^.svn$', '^.hg$' ]
" 只剩一个NERDTree窗口时退出vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
map <silent> <F2> :NERDTreeToggle<cr> " 按下 F2 调出/隐藏 NERDTree
" ========================================================================== "


" ===============================NERDTreeTab==================================== "
let NERDTreeShowHidden                      = 1                    " shift +i to toggle
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_no_startup_for_diff     = 0
map <silent> <F3> :NERDTreeTabsToggle<CR>
" ========================================================================== "


" ===============================ctrlp==================================== "
let g:ctrlp_max_files   = 0     " list all file from Does not find all files #234
                                " https://github.com/kien/ctrlp.vim/issues/234
let g:ctrlp_show_hidden = 1     "find hidden file
" ========================================================================== "

" ================================EasyAlign================================= "
vnoremap <silent> <Enter> :EasyAlign<cr>
" ========================================================================== "

" ===============================ultisnips================================== "
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ========================================================================== "

" ==============================syntastic=================================== "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ========================================================================== "








