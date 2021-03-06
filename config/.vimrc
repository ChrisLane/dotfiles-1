" VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Deoplete
Plugin 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1

" Neomake
Plugin 'benekastah/neomake'
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/error.log'
let g:neomake_open_list = 2
map <C-s> :Neomake<CR>

" Other plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-scala'
Plugin 'itchyny/lightline.vim'
Plugin 'juanedi/predawn.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'rust-lang/rust.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'w0rp/ale'
Plugin 'zah/nim.vim'

" VUNDLE
call vundle#end()            " required
filetype plugin indent on    " required

" CtrlP
let g:ctrlp_show_hidden = 1

" Enable syntax highlighting
syntax on
set t_Co=256

" lightline
set laststatus=2

" Set leader to space
let mapleader = " "

" Set wrapping key
set nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End> g<End>
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End> <C-o>g<End>
  endif
endfunction

" Color scheme
colorscheme predawn

" Show numbers on side
set number
set relativenumber

" Double Esc to save
map <Esc><Esc> :w<CR>

" ALE keybindings
nnoremap <leader>j :ALENextWrap<CR>
nnoremap <leader>k :ALEPreviousWrap<CR>
nnoremap <leader>i :ALEDetail<CR>

" fzf keybindings
map <C-p> :GFiles<CR>
map <leader>p :Files<CR>
map <leader>l :Lines<CR>
map <leader>a :Ag<CR>

" Tabs to 2x space
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set autoindent
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

" Highlight line when in insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" For gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Searching
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" Run the last command used in the last window
nnoremap <leader>r :!$scr/last-command-last-window.sh<CR>

" Goyo options
map <leader>g :Goyo<CR>
autocmd! User GoyoEnter nested call ToggleWrap()
autocmd! User GoyoLeave nested call ToggleWrap()

