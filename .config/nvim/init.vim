"  ________       ______       _________                   
" |_____  |      /  __  \      |   _____|  Technical Architet T         
"      |  |     /  /  \  \     |  |               
"      |  |    /  /    \  \    |  |        https://github.com/Syuq/.dotfiles     
"      |  |   /  /      \  \   |  |
"      |  |  /  /        \  \  |  |                         
"      |__| /__/          \__\ |__|         
" My neovim config.
"
call plug#begin('~/.config/nvim/plugged')

" Define bundles via Github repos
Plug 'vimwiki/vimwiki'
Plug 'neovim/nvim-lspconfig'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'unblevable/quick-scope'
Plug 'honza/vim-snippets'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-sensible'
"Plug 'preservim/nerdcommenter'
"Plug 'ervandew/supertab'
Plug 'windwp/nvim-autopairs'
Plug 'sheerun/vim-polyglot'
" Plug 'editorconfig/editorconfig-vim'
Plug 'alvan/vim-closetag'
" Plug 'dart-lang/dart-vim-plugin'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'lukas-reineke/indent-blankline.nvim'"
" Lua
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

Plug 'mhinz/vim-startify'

call plug#end()

" Leader
let mapleader = " "

set guifont=JetBrainsMono\ Nerd\ Font:h9
" set guifont=JoyPixels:h9
set encoding=UTF-8
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
" set noswapfile
set history=1000
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

set autoindent
set smartindent

set autoread
set autowrite

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Numbers
set relativenumber
set number
set numberwidth=5
hi CursorLineNr guifg=#af00af
set cursorline
set cursorlineopt=number

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Copy to clipboard
set clipboard=unnamed

" Colorscheme
set lazyredraw
set termguicolors

" WikiVim
"set nocompatible
"filetype plugin on
"syntax on

set foldmethod=manual

" set background=dark

" Example config in VimScript
" let g:tokyonight_style = "storm"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" " Change the "hint" color to the "orange" color, and make the "error" color bright red
" let g:tokyonight_colors = {
"   \ 'hint': 'orange',
"   \ 'error': '#ff0000'
" \ }

" Load the colorscheme
" colorscheme tokyonight
 colorscheme nord
" Auto indenting
" filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" if filereadable(expand("~/.vimrc.bundles"))
"   source ~/.vimrc.bundles
" endif

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" Go file config
" au FileType go set noexpandtab
" au FileType go set shiftwidth=4
" au FileType go set softtabstop=4
" au FileType go set tabstop=4

" au BufRead,BufNewFile .eslintrc.json setlocal filetype=json
" au BufRead,BufNewFile .babelrc setlocal filetype=json
" au BufRead,BufNewFile .prettierrc setlocal filetype=json

" au BufRead,BufNewFile .babelrc.js setlocal filetype=javascript
" au BufRead,BufNewFile .sequelizerc setlocal filetype=javascript
" au BufRead,BufNewFile *.hbs setlocal filetype=html

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Use tab with text block
vmap <Tab> >gv
vmap <S-Tab> <gv

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nmap = :res +2<CR> " increase pane by 2 
nmap - :res -2<CR> " decrease pane by 2
nmap ] :vertical res +2<CR> " vertical increase pane by 2
nmap [ :vertical res -2<CR> " vertical decrease pane by 2

" Remove highlight
map <C-h> :nohl<CR>

" NERD tree configuration
noremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

" fzf
noremap ` :Files<CR>
noremap <M-;> :Buffers<CR>

" bind \ (backward slash) to grep shortcut
nnoremap <Leader>\ :Ag <C-R><C-W><CR>
"nnoremap <C-k> /<C-R><C-W><CR>
nnoremap \ :Ag<SPACE>

let g:coc_global_extensions = ['coc-java']
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:coc_status_error_sign = ' '
let g:coc_status_warning_sign = ' '

" hi! CocErrorSign guifg=#d1666a
hi! CocErrorSign guifg=#ff5555
hi! CocInfoSign guibg=#353b45
hi! CocWarningSign guifg=#d1cd66
" coc.vim config
" Remap keys for gotos
" GoTo code navigation.

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap R :CocCommand <CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Easymotion
" s{char}{char} to move to {char}{char} over windows
nmap <Leader>F <Plug>(easymotion-overwin-f)
" Move to line over windows
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Search n-chars
map / <Plug>(easymotion-sn)

" Lightline 
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified', 'coc_error', 'coc_warning', 'coc_hint', 'coc_info' ] ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
\ 'component_expand': {
  \   'coc_error'        : 'LightlineCocErrors',
  \   'coc_warning'      : 'LightlineCocWarnings',
  \   'coc_info'         : 'LightlineCocInfos',
  \   'coc_hint'         : 'LightlineCocHints',
  \   'coc_fix'          : 'LightlineCocFixes',
  \ },
      \ }

" fzf.vim
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' ctermfg=155
highlight QuickScopeSecondary guifg='#5fffff' ctermfg=81

" Copy and paste to system clipboard with <Leader>p and <Leader>y
vmap <Leader>y "+y
vmap <Leader>d "+d
noremap gV `[v`]
nnoremap <CR> G
nnoremap <BS> gg

" system clipboard
nmap <a-c> "+y
vmap <a-c> "+y
nmap <a-v> "+p
inoremap <a-v> <c-r>+
cnoremap <a-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>

" Auto pair
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rnf :call RenameFile()<cr>

"cmap w!! %!sudo tee > /dev/null %

lua <<EOF
-- indent-blankline
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    --show_current_context_start = true,
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "java",
    "c",
    "c_sharp",
    "javascript",
    "php",
    "css",
    "html",
    "cpp",
  },
}
EOF

" Auto close tag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.vue'
let g:closetag_emptyTags_caseSensitive = 1
let g:jsx_ext_required = 0


" Neovide
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_input_use_logo=v:true
let g:neovide_cursor_antialiasing=v:true
" let g:neovide_fullscreen=v:true

" Emmet
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Supprot for different goto definitions for different file types.
autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>

let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_linters_ignore = {
      \   'typescript': ['tslint'],
      \}

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
highlight ALEWarning ctermbg=DarkMagenta

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()


let g:lightline.component_type = {
\   'coc_error'        : 'error',
\   'coc_warning'      : 'warning',
\   'coc_info'         : 'tabsel',
\   'coc_hint'         : 'middle',
\   'coc_fix'          : 'middle',
\ }

function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = ''
  endtry
  return printf('%s %d', s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction
\ }

autocmd User CocDiagnosticChange call lightline#update()

