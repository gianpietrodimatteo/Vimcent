""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" " " Set to space

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearence
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme desert
set laststatus=2 " Always display the status line
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Turns off compatibility with vi
set mouse=a " Enables mouse support
syntax enable " Enables syntax highlighting
set encoding=utf-8 " Sets encoding shown in terminal
set fileencodings=utf-8 " Sets encoding of written files
set splitright splitbelow " Orientation of splitting windows
set ignorecase " Defaults search to ignore case
nnoremap <M-c> :set ignorecase! <CR> " Maps alt c to toggle ignore case
set incsearch " Highlight all search matches
set formatoptions-=cro " Disable automatic comenting on new line
set expandtab shiftwidth=2 softtabstop=2 " Use tab as 2 spaces
set autoindent " Enter mantains previous indentation
set tw=0 " Text width (line length) in characters. 0 means disabled
set matchpairs=(:),{:},[:],<:>,?:\: " % takes you to matching pairs
set number " Shows line numbers
set history=500 " Set command history to remember 500 commands
set hlsearch " Use highlighting when doing a search
set lazyredraw " Don't redraw while executing macros (good performance config)

" Activates filetype detection. This allows you to assign different syntax, 
" plugins and indentation for different file types
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete " Turns completion on 
set wildmode=longest,list,full " Adjustments on completion selection

" Backspace over indentation from autoindent
" Backspace over an end of line (eol) character
" Backspace past the position where you started Insert mode
set backspace=indent,eol,start  

" Use systems cut, copy and paste registers
set clipboard=unnamedplus

set wildmenu " Turn on wild menu
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Highlight column 81 
highlight ColorColumn ctermbg=grey
set colorcolumn=81

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup, swap and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets vim burocracy folders (be sure to create the folders yourself)
set backupdir=~/.vim/backup// " Backup
set directory=~/.vim/swap// " Swap

" Turn persistent undo on. This means that you can undo even when you close a 
" buffer/VIM
try
  set undodir=~/.vim/undo// " Undo
  set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Alt moves lines
nmap <m-j> Vmp
nmap <m-k> VmkP
vmap <m-j> Vmp
vmap <m-k> VmkP

" Quick newline
nnoremap <leader><Enter> o<Esc>

" Quick macros
nnoremap <Space>q @q

" Ctrl+a select all
nnoremap <C-a> ggVG

"  Search for selection
vnoremap # y?\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" Correct indentation and apply line wrap
nnoremap <m-f> V=Vgq<CR>
" Correctly indent the whole file motherfuckerrr
nnoremap <leader>f :g/./ normal gqq<CR>:noh<CR>

" F7 corrects indentation
nnoremap <F7> gg=G<C-o><C-o>

" Print time stamp
nnoremap <F2> :read !date<CR>

" Escaping on normal mode turns off search highlighting
nnoremap <Esc> :nohlsearch<CR>

" Prompt before force quitting
cnoremap <silent> q!<CR>  :call ConfirmQuit()<CR>
nmap ZQ :call ConfirmQuit()<CR>
cnoremap <silent> qa!<CR>  :call ConfirmQuitAll()<CR>

" Easy quit, save, one or all
nnoremap ZW :call ConfirmQuitAll()<CR> " Quit without saving all
nnoremap ZS :wa<CR> " Save all
nnoremap ZA :update<CR> " Save current buffer
nnoremap ZX :xa<CR> " Save all and quit


" TODO adjust here
" => Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim

" Quick source current configuration file
nmap <leader><leader>o :so %<Enter>

" Remapping cxco to ctrl+space
imap <C-Space> <C-X><C-O>

" Make easy enter
nnoremap <leader><Enter> i<Enter><Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Confirm quit
function! ConfirmQuit()
  if (&modified==1)
    if (confirm("Close this buffer and discard changes?", "&Yes\n&No", 2)==1)
      :quit!
    endif
  else
    :quit!
  endif
endfu

function! ConfirmQuitAll()
  if (len(filter(getbufinfo(), 'v:val.changed == 1')) > 0)
    if (confirm("Close all buffers and discard changes?", "&Yes\n&No", 2)==1)
      :qa!
    endif
  else
    :qa!
  endif
endfu

" Toggle line wrapping at 80 characters
let s:wrapping = 0
function! ToggleWrapFunction()
  if s:wrapping == 0
    let s:wrapping = 1
    set tw=80
  else
    let s:wrapping = 0
    set tw=0
  endif
endfunction

command ToggleWrap call ToggleWrapFunction()

" Delete swap files on save
function! DeleteSwapFiles()
  let si = trim(execute(":swapname"))[0:-4]
  call delete(si . 'swp')
  call delete(si . 'swo')
  call delete(si . 'swn')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Event hooks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Delete swap files on save
autocmd BufWritePost * call DeleteSwapFiles()
