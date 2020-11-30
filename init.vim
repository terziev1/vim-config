call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim' "https://github.com/joshdick/onedark.vim
Plug 'itchyny/lightline.vim' "https://github.com/itchyny/lightline.vim
Plug 'vim-airline/vim-airline' "https://github.com/vim-airline/vim-airline
Plug 'ctrlpvim/ctrlp.vim' "https://github.com/ctrlpvim/ctrlp.vim
Plug 'sheerun/vim-polyglot' "https://github.com/sheerun/vim-polyglot
Plug 'preservim/nerdcommenter' "https://github.com/preservim/nerdcommenter
Plug 'neoclide/coc.nvim', {'branch': 'release'} "https://github.com/neoclide/coc.nvim
Plug 'airblade/vim-gitgutter'  "https://github.com/airblade/vim-gitgutter
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim',
Plug 'dense-analysis/ale'
call plug#end()
" Leader Mapping
map <Space> <leader>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Explorer
nmap <space>e :CocCommand explorer<CR>
nmap <space>w <C-W>w
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Emmet
let g:user_emmet_leader_key=','
" Tagalong
let g:tagalong_filetypes = ['html',"svelte","vue"]
"Starting directory CtrlP
let g:ctrlp_working_path_mode = 'ra'
" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/bundle/*,*/node_modules/.git
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Theme
syntax on
"au! BufNewFile,BufRead *.svelte set ft=html
au BufNewFile,BufRead,BufReadPost *.svelte set syntax=html
let g:ale_linter_aliases = {
\   'svelte': ['javascript']
\}
let g:ale_linters = {
\   'svelte': ['eslint']
\}
let g:ale_fixers = {
\   'svelte': ['eslint']
\}
colorscheme onedark
set termguicolors
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
let g:airline_theme='onedark'
let g:vue_disable_pre_processors=1
set title
set hid
set norelativenumber
set autoread
set clipboard+=unnamedplus            " Maps yank to clipboard buffer (needs xsel)
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set history=500
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set expandtab shiftwidth=2 tabstop=2  " Four spaces for tabs everywhere
set number
