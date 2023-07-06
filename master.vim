" Vimcent the lean vim configuration

" Leader setting
let mapleader=" " " Set to space

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

" Prompt before force quitting
cnoremap <silent> q!<CR>  :call ConfirmQuit()<CR>
nmap ZQ :call ConfirmQuit()<CR>
cnoremap <silent> qa!<CR>  :call ConfirmQuitAll()<CR>

" Basics

set nocompatible " Turns off compatibility with vi
set mouse=a " Enables mouse support
syntax enable " Enables syntax highlighting
set encoding=utf-8 " Sets encoding shown in terminal
set fileencodings=utf-8 " Sets encoding of written files
set laststatus=2 " Always display the status line
set splitright splitbelow " Orientation of splitting windows
set ignorecase " Defaults search to ignore case
nnoremap <M-c> :set ignorecase! <CR> " Maps alt c to toggle ignore case
set incsearch " Highlight all search matches

" Activates filetype detection, assigning different syntax, plugins and indentation
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete " Turns completion on 
set wildmode=longest,list,full " Adjustments on completion selection

" Disable automatic comenting on new line
set formatoptions-=cro

" Sets vim burocracy folders (be sure to create the folders yourself)
set backupdir=~/.vim/backup// " Backup
set directory=~/.vim/swap// " Swap
set undodir=~/.vim/undo// " Undo

" DISABLE IN TEXTMODE
" Use tab as 2 spaces
set expandtab shiftwidth=2 softtabstop=2 

" DISABLE IN TEXTMODE
" Enter mantains previous indentation
set autoindent

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Delete swap files on save
function! DeleteSwapFiles()
    let si = trim(execute(":swapname"))[0:-4]
    call delete(si . 'swp')
    call delete(si . 'swo')
    call delete(si . 'swn')
endfunction

autocmd BufWritePost * call DeleteSwapFiles()

" Text width (line length) in characters. 0 means disabled
set tw=0 

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

" % takes you to matching pairs
set matchpairs=(:),{:},[:],<:>,?:\:

" Backspace over indentation from autoindent
" Backspace over an end of line (eol) character
" Backspace past the position where you started Insert mode
set backspace=indent,eol,start  

" Use systems cut, copy and paste registers
set clipboard=unnamedplus

" Basic keybindings

" Easy quit, save, one or all
nnoremap ZW :call ConfirmQuitAll()<CR> " Quit without saving all
nnoremap ZS :wa<CR> " Save all
nnoremap ZA :update<CR> " Save current buffer
nnoremap ZX :xa<CR> " Save all and quit

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

" TODO add stuff here
" File specific styles
au BufRead,BufNewFile *.txt setlocal tw=80

" CUTLASS

function! OverrideSelectBindings()
  let i = 33

  " Add a map for every printable character to copy to black hole register
  " I see no easier way to do this
  while i <= 126
      if i !=# 124
          let char = nr2char(i)
          if i ==# 92
            let char = '\\'
          endif
          exec 'snoremap '. char .' <c-o>"_c'. char
      endif

      let i = i + 1
  endwhile

  snoremap <bs> <c-o>"_c
  snoremap <space> <c-o>"_c<space>
  snoremap \| <c-o>"_c|
endfunction

function! HasMapping(mapping, mode)
  return maparg(a:mapping, a:mode) != ''
endfunction

function! AddWeakMapping(left, right, modes, ...)
  let recursive = a:0 > 0 ? a:1 : 0

  for mode in split(a:modes, '\zs')
      if !hasMapping(a:left, mode)
          exec mode . (recursive ? "map" : "noremap") . " <silent> " . a:left . " " . a:right
      endif
  endfor
endfunction

function! GetVersion()
  return "1.0"
endfunction

function! OverrideDeleteAndChangeBindings()
  let bindings =
  \ [
  \   ['c', '"_c', 'nx'],
  \   ['cc', '"_S', 'n'],
  \   ['C', '"_C', 'nx'],
  \   ['s', '"_s', 'nx'],
  \   ['S', '"_S', 'nx'],
  \   ['d', '"_d', 'nx'],
  \   ['dd', '"_dd', 'n'],
  \   ['D', '"_D', 'nx'],
  \   ['x', '"_x', 'nx'],
  \   ['X', '"_X', 'nx'],
  \ ]

  for binding in bindings
      call call("addWeakMapping", binding)
  endfor
endfunction

function! RedirectDefaultsToBlackhole()
  call OverrideDeleteAndChangeBindings()
  call OverrideSelectBindings()
endfunction

" Cutlass Mappings
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D
