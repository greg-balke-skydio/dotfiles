"""" vundle install
let fresh_install=0
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    let fresh_install=1
endif

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

autocmd FileType make set local noexpandtab

filetype off                  " required

" Save last position of cursor!
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" set vim to chdir for each file
autocmd BufEnter * silent! lcd %:p:h

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set guifont=Liberation\ Mono\ for\ Powerline\ Regular\ 10

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'

" Includes YCM underneath
Plugin 'zxqfl/tabnine-vim'

" Fancy footer/header
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ludovicchabant/vim-gutentags'
Plugin 'vim-scripts/TagHighlight'
Plugin 'itchyny/vim-cursorword'
Plugin 'sheerun/vim-polyglot'

" Expanding directory navigation
Plugin 'scrooloose/nerdtree'

" Auto-search directories
Plugin 'kien/ctrlp.vim'

Plugin 'Yggdroot/indentLine'

Bundle "myusuf3/numbers.vim"
" The following are examples of different formats supported.

" " install plugins
if fresh_install == 1
    PluginInstall
endif
call vundle#end()

" Force syntax highlighting
au BufReadPost *.tex set syntax=context

" Extra Whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

colorscheme molokai

set laststatus=2
set ttimeoutlen=50
set scrolloff=5

syntax on

set path+=**
set wildmenu
set wildmode=longest:full,full

"""" arrow key remapping
nmap <silent> <Up> :exe "resize +5"<CR>
nmap <silent> <Down> :exe "resize -5"<CR>
nmap <silent> <Right> :exe "vert resize +5"<CR>
nmap <silent> <Left> :exe "vert resize -5"<CR>
set mouse=

""" NERDTree
nnoremap ,, :NERDTree<Return>
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

""" Gutentags
let g:gutentags_cache_dir = '~/.cache/tags'

""" Ctrl+P
let g:ctrlp_working_path_mode = 'ra'

""" You Complete Me
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

""" Tab dots
let g:indentLine_char = '·'
let g:indentLine_fileTypeExclude = ['json', 'markdown']
let g:indentLine_color_term=237

""" air-line
let g:airline_theme='jellybeans'
"'base16_monokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
