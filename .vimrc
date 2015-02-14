set runtimepath+=~/.vim_runtime

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
