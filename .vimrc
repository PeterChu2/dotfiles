set runtimepath+=~/.vim_runtime

let g:ycm_auto_trigger = 0


source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
set nrformats=
set history=200
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
set nocompatible
filetype plugin on
runtime macros/matchit.vim
set pastetoggle=<f5>


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
 

" set clipboard=unnamedplus
set clipboard=unnamed

set tabstop=2
set expandtab
set shiftwidth=2

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1

:imap <C-J> <Plug>snipMateNextOrTrigger
:smap <C-J> <Plug>snipMateNextOrTrigger
:imap <C-p> <Plug>snipMateNextOrTrigger
:smap <C-p> <Plug>snipMateNextOrTrigger

set omnifunc=syntaxcomplete#Complete
set nu



noremap <leader>f :Ag 


" Yank selected text or a line into the system clipboard, respectively.
noremap <leader>y "*y
noremap <leader>yy "*Y
vnoremap <C-c> "*y

noremap <C-v> "*p
noremap <leader>p "*p

" Preserve indentation while pasting text from the system clipboard.
" noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>



" noremap <C-v> :r !pbpaste<CR><CR>


" :set tags=~/mytags

nmap <leader>tt :TagbarToggle<CR>

map <leader>ct :!ctags -R .<cr>








" Fugitive mapping
nmap <leader>gbb :Gblame<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gg :Ggrep 
nmap <leader>gl :Glog<cr>
nmap <leader>gp :Git pull<cr>
nmap <leader>gP :Git push<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gb :Gbrowse<cr>
nmap <leader>g? :map <leader>g<cr>
