let g:polyglot_disabled = ['c/c++', 'c++11']
let g:mwExclusionPredicates = [function('mark#DefaultExclusionPredicate')]
let g:mwMaxMatchPriority = -10
let g:tagbar_position = 'botright vertical'

call plug#begin('~/.config/nvim/plugged')

"Plug 'kien/ctrlp.vim'
"Plug 'mileszs/ack.vim'
"Plug 'ivanov/vim-ipython'
"Plug 'mhinz/vim-signify'  " needs to save file to see diff...

Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-expand-region'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'pboettch/vim-highlight-cursor-words'
Plug 'caigithub/a_indent'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'Shougo/denite.nvim'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'lervag/vimtex'

call plug#end()

filetype plugin indent on

set exrc
set secure
let mapleader = '\'

syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cursorline
"set cino=g0,:0,N-s,i4,(0,j1,w1,W2s " old one
set cino=g0,:0,N-s,i4,(0,j1,W2s
set dir=/tmp/nvim-swap " swap file directory
set guioptions-=T
set wildmode=longest,list,full
set wildmenu
set nowrap

set colorcolumn=80
set formatoptions+=t
set textwidth=79

let &path.="src/include,/usr/include,"

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

function! Refactor()
    call inputsave()
    let @z=input("What do you want to rename '" . @z . "' to? ")
    call inputrestore()
endfunction

" Locally (local to block) rename a variable
nmap <Leader>rv "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>:%s/<C-R>//<c-r>z/g<cr>`x

noremap <C-F4> :MBEbd<cr>
nmap <F7> :TagbarOpenAutoClose<cr>
nmap <F8> :TagbarToggle<cr>
nnoremap <F9> :make!<cr>
nnoremap <C-PageUp> :MBEbp<cr>
inoremap <C-PageUp> <esc>:MBEbp<cr>
nnoremap <C-PageDown> :MBEbn<cr>
inoremap <C-PageDown> <esc>:MBEbn<cr>
nnoremap <F5> :YcmForceCompileAndDiagnostics<cr><cr>
inoremap <F5> <esc>:YcmForceCompileAndDiagnostics<cr><cr>
nnoremap <F11> :MBEbp<cr>
inoremap <F11> <esc>:MBEbp<cr>
nnoremap <F12> :MBEbn<cr>
inoremap <F12> <esc>:MBEbn<cr>
noremap <C-TAB> :MBEbf<cr>
noremap <C-S-TAB> :MBEbb<cr>
inoremap jk <esc>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>jj :YcmCompleter GoTo<cr>
nnoremap <leader>jd :YcmCompleter GoToDefinition<cr>
nnoremap <leader>jt :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>ji :YcmCompleter GoToInclude<cr>
nnoremap <leader>t :YcmCompleter GetType<cr>
nnoremap <leader>f :YcmCompleter FixIt<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>o :Files<cr>
nnoremap <leader>w :Windows<cr>
nnoremap <leader>= :ClangFormat<cr>
vnoremap <leader>= :ClangFormat<cr>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" These are for MAC
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
nmap , <Plug>(easymotion-s)
vmap , <Plug>(easymotion-s)

"nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" airline always on
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_theme="murmur"
let g:airline_section_y=''
let g:airline_powerline_fonts = 1

colorscheme zenburn

hi CursorLine guibg=#333
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

set hls
set ic
set autowriteall
set mouse=a
set hidden
set nu
set wrap
set textwidth=78
set incsearch

let g:UltiSnipsExpandTrigger = "<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:ycm_always_populate_location_list = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_max_diagnostics_to_display = 0

set updatetime=250

let g:ackprg = 'ag --vimgrep'

" Remove trailing whitespace on save
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.cc :%s/\s\+$//e
autocmd BufWritePre *.hpp :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd FileType make setlocal noexpandtab

" Visible vs. physical line movement

" CtrlP ignore paths
let g:ctrlp_custom_ignore = {
      \ 'dir': '\W\.git$\|build$',
      \ 'file': '\.exe$\|\.so$\|\.o'
      \ }

au BufReadPost *.launch set filetype=xml
au BufReadPost *.xacro set filetype=xml
au BufReadPost *.urdf set filetype=xml

" GitGutter
let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_removed_first_line = '▲'
let g:gitgutter_sign_modified_removed = '█'

highlight GitGutterAdd guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#bbbb00 guibg=#073642 ctermfg=3 ctermbg=0
highlight GitGutterDelete guifg=#ff2222 guibg=#073642 ctermfg=1 ctermbg=0

" vebugger
let g:vebugger_leader='<Leader>d'
let g:vebubger_path_gdb='arm-none-eabi-gdb'

autocmd FileType c,cpp set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,bO:///,O://

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction

autocmd Syntax cpp call EnhanceCppSyntax()

" Highlight cursor words
let g:HiCursorWords_delay = 100
let g:HiCursorWords_linkStyle='PmenuThumb'

highlight ColorColumn ctermbg=darkgray
highlight ColorColumn guibg=#484848
