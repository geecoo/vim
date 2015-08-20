"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"
let g:mapleader = ";"

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set number
set cursorline
set cursorcolumn
set showmode

if has("syntax")
    syntax on
endif

" based on the code folding indentation or grammar
" za open or close the current folding
" zM close all folding
" zR open  all folding
"set foldmethod=indent
set foldmethod=syntax
" starting vim closed when folding
set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"colorscheme molokai
"colorscheme phd
colorscheme solarized
let g:solarized_termcolors=256
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
set fileencodings=ucs-bom,utf-8,gb18030,gbk,gk2312,euc-jp,euc-kr,big5,latin1
set termencoding=utf-8

"set langmenu=zh_CN.utf-8 
"language messages zh_CN.utf-8 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" 让 vim 把连续数量的空格视为一个制表符
"set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map nw <C-W><C-W>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"set statusline=%f\ %y%r%l*%m%*\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ %4c\ %4l\ [%p%%]
set statusline=%F%m%r%h%w\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ [POS=%l,%v]\ [%p%%]\ \ [LEN=%L]\ \[%{strftime(\"%Y-%m-%d\ %H:%M\")}] 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" copy the text to the system clipboard
vnoremap <Leader>y "+y

" the system clipboard contents paste to vim
nmap <Leader>p "+p

nmap <Leader>pa %



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction



"""""""""""[End Of The Basic Configuration]""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle(https://github.com/gmarik/Vundle.vim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  
set rtp+=~/.vim/bundle/vundle
"call vundle#rc()
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/a.vim'
Plugin 'Sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'wesleyche/Trinity'
Plugin 'wesleyche/SrcExpl'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'minibufexpl.vim'
"Plugin 'joonty/vim-phpqa'

"Plugin 'bling/vim-airline'
"Plugin 'altercation/vim-colors-solarized'

"plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-rails.git'
"Plugin 'Valloric/YouCompleteMe'

"plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Plugin 'FuzzyFinder'

"Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'https://github.com/Valloric/YouCompleteMe.git'
call vundle#end()
filetype plugin indent on    " required 

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Sirver/ultisnips configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Depends on honza/vim-snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"let g:UltiSnipsSnippetDirectories=['bundle/vim-snippets/UltiSnips']



"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => scrooloose/syntastic configure 
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_error_symbol='X'
"let g:syntastic_warning_symbol='#'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Trinity/SourceExplorer/TagList
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 

" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 

" Open and close the Taglist separately 
nmap <F10> :TrinityToggleTagList<CR> 

" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR> 

nmap <silent> <C-R> :BufExplorer<CR>
nmap <silent> <C-N> :bnext!<CR>
nmap <silent> <C-P> :bprev!<CR>
nmap <silent> <C-A> :A<CR>


""""""""""""""""""""""""""""""""""""
" SrcExpl 预览框功能
" """"""""""""""""""""""""""""""""""
" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 24

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 1

" // Use program 'ctags' with argument '--sort=foldcase -R' to create or
" // update a tags file
let g:SrcExpl_updateTagsCmd = "/usr/bin/ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "" 

exe "nnoremap <F4>" 
              \ " :call g:UpdateCscope()<CR>"  
              \ " :call g:SrcExpl_UpdateTags()<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""" 
if &diff
let Tlist_Auto_Open=0 "don't auto pen when compare two files
else
let Tlist_Auto_Open=0 "auto pen Tlist when open a file
endif

"set taglist window in right, delete the following line if you don't like
"let Tlist_Use_Right_Window=1
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1
"auto close Tlist when exiting file.
let Tlist_Exit_OnlyWindow = 1

"autocmd BufEnter * cd %:p:h

let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Auto_Open = 1
let Tlist_WinWidth = 36


let g:NERDTreeDirArrows=0
let g:NERDTreeShowHidden=1

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=0  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapCTabSwitchBufs = 0
let g:miniBufExplModSelTarget = 0 

