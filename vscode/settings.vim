set tabstop=2 softtabstop=2
set clipboard+=unnamed
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set nohlsearch
set noerrorbells
set nu
set nowrap
set incsearch
set signcolumn=yes
set hidden
set scrolloff=8
set signcolumn=yes
set mouse=a
set updatetime=200

let mapleader = " "
nnoremap <leader>j 25j
nnoremap <leader>k 25k

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>

nnoremap <leader>e :call VSCodeNotify('multiCommand.gotoNextProblem')<CR>
nnoremap <leader>w :call VSCodeNotify('workbench.action.files.save')<CR>
nnoremap <leader>a :call VSCodeNotify('editor.action.quickFix')<CR>
nnoremap <leader>t :call VSCodeNotify('workbench.action.focusSideBar')<CR>:call VSCodeNotify('workbench.action.focusSideBar')<CR>
nnoremap <leader>f :call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <leader>F :call VSCodeNotify('workbench.action.quickOpen')<CR>
