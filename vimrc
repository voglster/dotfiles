set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" plugins on github
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'benmills/vimux'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround' 
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required

autocmd!

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

set autoindent
set smartindent     " indent when
set tabstop=2       " tab width
set softtabstop=2   " backspace
set shiftwidth=2    " indent width

" quicker escape
inoremap jk <esc>
inoremap kj <esc>

" quicker escape
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" get rid of the arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" xmpfilter
map <F4> <Plug>(xmpfilter-mark)
map <F5> <Plug>(xmpfilter-run)

" run this file
nnoremap <F9> :!%:p<CR>

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" => Status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Solarized theme
syntax enable
set background=dark
colorscheme solarized

" Show hidden characters
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>
set hidden

" Line numbers
set nu
nmap <leader>n :set nu!<CR>

" higlhlingting the cursor
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>v :read !xclip -o<CR>
