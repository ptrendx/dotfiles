" ~/.vimrc (configuration file for vim only)

if &shell =~# 'fish$'
    set shell=sh
endif

if &term =~ '^screen'
     "tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set backspace=indent,eol,start

let g:rbpt_colorpairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['white',       'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe'
"Plugin 'SirVer/ultisnips'

Plugin 'gmarik/Vundle.vim'

"Plugin 'honza/vim-snippets'

Plugin 'altercation/vim-colors-solarized'

"Plugin 'dag/vim-fish'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
"Plugin 'christoomey/vim-tmux-navigator'
" plugin on GitHub repo
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
runtime  macro/matchit.vim on
filetype plugin on
" To ignore plugin indent changes, instead use:

au BufRead,BufNewFile *.cuh set filetype=cuda
"au! Syntax MyCUDA source ~/cuda/MyCuda.vim
"au BufRead,BufNewFile *.py set noexpandtab
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_bold=1
syntax on
syntax enable
colorscheme wombat256mod
let g:airline_solarized_bg = "dark"
let g:airline_theme = "solarized"
let g:airline_powerline_fonts = 1

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-Left> <C-w>h
nnoremap <silent> <C-Down> <C-w>j
nnoremap <silent> <C-Up> <C-w>k
nnoremap <silent> <C-Right> <C-w>l

set hidden
set cindent
set autoindent
set smartcase
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set incsearch
set showcmd
set showmatch
set ignorecase
set mouse=a

if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif
set wildignore+=.*
set wildignore+=*.nav,*.toc,*.aux,*.snm,*.vrb
set wildignore+=*.o,*.a
set wildignore+=*.jpg,*.bmp,*.pdf,*.png,*.gif,*.pbm,*.pgm,*.ppm
set wildignore+=*.graphml

"set spell spelllang=pl,en
if has('nvim')
    set clipboard+=unnamedplus
else
    set clipboard=unnamedplus
endif
set hlsearch
set ttimeoutlen=50
noremap ; :
set number
set showbreak=↪
set splitbelow
set splitright
set wildmenu
let g:tex_fold_enabled=1

"nnoremap <silent> <C-Left> <C-W>h
"nnoremap <silent> <C-Right> <C-W>l
"nnoremap <silent> <C-Up> <C-W>k
"nnoremap <silent> <C-Down> <C-W>j
nnoremap <ins> <nop>
set laststatus=2
set noshowmode
let mapleader =","

nnoremap <leader>z zMzvzz
nnoremap <space> za
vnoremap <space> za
nnoremap <leader><space> zA
nnoremap <leader>m :wa<cr>:!make<cr>
nnoremap <leader>{ i<home><cr><esc>ki{<esc>jj<home>i<cr><esc>ki}<esc>k==

nnoremap <leader>ev :vs $MYVIMRC<cr>

nnoremap <c-u> gUiw
inoremap <c-u> <esc>gUiwea

nnoremap <leader>vv ^vg_

inoremap <c-d> <esc>ddi
vnoremap <c-d> d<esc>i

cnoremap q1 q!

"set runtimepath+=~/.vim/bundle/MySettings
" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsListSnippets='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsExpandTrigger="<c-j>"

let g:ycm_confirm_extra_conf=0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1

nnoremap <leader>] :YcmCompleter GoTo<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


nnoremap <leader>n :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"hi Pmenu ctermbg=222
"hi PmenuSel ctermfg=172 ctermbg=232


"if &diff
    "colorscheme diffscheme
"endif

nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

set history=1000

inoremap <silent> <c-v> <c-r><c-p>+
inoremap <c-e> <c-r>=

set list listchars=tab:»\ ,trail:·

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nnoremap <leader>a :Ack 
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>q :ccl<cr>
nnoremap <leader>s :%s/\s\+$//e<cr>

noremap <F1> <esc>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set cursorline
let g:tex_flavor="latex"
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

set exrc

" ~/.vimrc ends here
