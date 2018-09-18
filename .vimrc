" Handy vanilla Vim settings
set background=dark
set incsearch
set wildmenu
set wildmode=longest,list
set backspace=indent,eol,start
set laststatus=2
set ruler

" Ironman mode
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>
"imap <Left> <Nop>
"imap <Right> <Nop>
"imap <Up> <Nop>
"imap <Down> <Nop>

" Search options
set hlsearch 
set incsearch 
set ignorecase 
set smartcase

" Indenting things
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
" Special Python indenting
au FileType python setl sw=4

" Line number toggling

function! NumberToggle() 
  if(&relativenumber != 1 && &number != 1) 
    set number 
    highlight LineNr ctermfg=gray 
  elseif(&relativenumber != 1 && &number == 1) 
    set relativenumber 
    highlight LineNr ctermfg=darkgray 
  else 
    set norelativenumber 
    set nonumber 
  endif 
endfunc 
nnoremap <C-n> :call NumberToggle()<CR>

" Go syntax highlighting and stuff.
filetype off
filetype plugin indent off
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Cscope options:
set csprg=gtags-cscope
set nocsverb
cs add GTAGS
set csverb
"set cscopequickfix=s-,c+,d-,i-,t-,e-
" This one replaces tags with cscope tagging.
set cst
" Cscope shortcuts.
map <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
map <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
map <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>

" Ctrl-P options:
set wildignore+=*.tmp,*.swp,*.so,*.zip
let g:ctrlp_custom_ignore = {
     \ 'dir': '\v((\.git|\.svn)|/(orlandodocs|publicdocs|build|output))',
          \ }
          let g:ctrlp_max_files = 910000
          let g:ctrlp_use_caching = 1
          let g:ctrlp_clear_cache_on_exit = 0
          let g:ctrlp_dotfiles = 0
          let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" Tag searching wth CtrlP
map <C-o> :CtrlPGtags<CR>
set rtp+=$HOME/.vim/bundle/CtrlPGtags
