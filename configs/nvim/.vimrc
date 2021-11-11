filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set number relativenumber

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'edkolev/tmuxline.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'

Plug 'ctrlpvim/ctrlp.vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colo codedark

autocmd filetype python nnoremap <F5> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype ruby nnoremap <F5> :w <bar> exec '!ruby '.shellescape('%')<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <C-n> :NERDTreeToggle<CR>

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:tmuxline_powerline_separators = 0

highlight SpecialKey ctermfg=Black
set list
set showbreak=↪\
set listchars=tab:»\ ,space:·,extends:›,precedes:‹,nbsp:␣

set signcolumn=yes

set hidden
set updatetime=300

set foldmethod=syntax
set nofoldenable

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `g]` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show docs in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
