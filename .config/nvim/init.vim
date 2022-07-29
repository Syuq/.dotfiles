"" File: .vimrc
" Maintainer: Syuq
"  ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
" ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"  ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"   ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"    ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"      ░░   ▒ ░░      ░     ░░   ░ ░
"       ░   ░         ░      ░     ░ ░
"      ░                           ░

" plug.vim {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
" Define bundles via Github repos
Plug 'andymass/vim-matchup'
Plug 'echasnovski/mini.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'github/copilot.vim'
Plug 'vimwiki/vimwiki'
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lualine/lualine.nvim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'NvChad/nvim-colorizer.lua'
Plug 'vladdoster/remember.nvim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'shaunsingh/nord.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'm-demare/hlargs.nvim'

Plug 'unblevable/quick-scope'
Plug 'honza/vim-snippets'
Plug 'rust-lang/rust.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-sensible'
"Plug 'preservim/nerdcommenter'
"Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'alvan/vim-closetag'
" Plug 'dart-lang/dart-vim-plugin'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'windwp/nvim-autopairs'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'windwp/nvim-ts-autotag'
" Plug 'sindrets/diffview.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fannheyward/go.vim', { 'for': 'go' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'fannheyward/telescope-maple.nvim'

Plug 'mhinz/vim-startify'

call plug#end()
" }}} plug.vim

" basic {{{
" Leader
" let mapleader = " "

set fileencoding=utf-8
set fileencodings=utf-8,utf-16le,utf-16,big5,euc-jp,euc-kr,latin-1
set guifont=JetBrainsMono\ Nerd\ Font:h9
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
set list listchars=tab:\|\ ,trail:·,eol:¬

set autoread
set autowrite

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Make it obvious where 90 characters is
set textwidth=88
set colorcolumn=+1

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

" Example config in Vim-Script
let g:nord_contrast = v:true
let g:nord_borders = v:true
let g:nord_disable_background = v:true
let g:nord_italic = v:true
let g:nord_enable_sidebar_background = v:true

" Load the colorscheme
colorscheme nord

" Example config in VimScript
let g:tokyonight_style = "storm"
let g:tokyonight_terminal_colors = "true"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]


" Auto indenting
filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif
" }}} basic

" mappings {{{
"cmap w!! %!sudo tee > /dev/null %

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

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

map <Leader>rnf :call RenameFile()<cr>

map <silent> <leader>ee :e $HOME/.config/nvim/init.vim<CR>
map <silent> <leader>dd :e $HOME/.config/nvim/dev.dict<CR>
setl dictionary+=$HOME/.config/nvim/dev.dict
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
nnoremap <leader>n :NERDTreeFocus<CR>
noremap <C-t> :NERDTreeToggle<CR>
nnoremap F :NERDTreeFind<CR>

" bind \ (backward slash) to grep shortcut
" nnoremap <Leader>\ :Ag <C-R><C-W><CR>
" nnoremap <C-k> /<C-R><C-W><CR>
" nnoremap \ :Ag<SPACE>

vmap <silent> <expr> p <sid>Repl()

" }}} mappings

" Go file config {{{
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
" }}} Go file config
" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Rust
let g:rust_clip_command = 'xclip -selection clipboard'

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'gitbranch': 'fugitiveHead()',
      \   'cocstatus': 'coc#status',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
\ 'component_expand': {
  \   'coc_error'        : 'LightlineCocErrors',
  \   'coc_warning'      : 'LightlineCocWarnings',
  \   'coc_info'         : 'LightlineCocInfos',
  \   'coc_hint'         : 'LightlineCocHints',
  \   'coc_fix'          : 'LightlineCocFixes',
  \ },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" }}} lightline

" NERDTree {{{
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1
" }}} NERDTree

" coc.nvim {{{
let g:coc_enable_locationlist = 0
let g:coc_global_extensions = [
      \'coc-dictionary',
      \'coc-ecdict',
      \'coc-eslint',
      \'coc-git',
      \'coc-go',
      \'coc-html',
      \'coc-json',
      \'coc-lists',
      \'coc-markdownlint',
      \'coc-marketplace',
      \'coc-mocword',
      \'coc-sh',
      \'coc-snippets',
      \'coc-sumneko-lua',
      \'coc-tsserver',
      \'coc-typos',
      \'coc-vetur',
      \'coc-vimlsp',
      \'coc-xml',
      \'coc-yaml',
      \'coc-yank'
      \]

let g:coc_filetype_map = {
      \ 'asciidoc': 'markdown',
      \ }

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

nmap <silent> gd :call <SID>go_to_definition()<CR>
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
" xmap <leader>fm  <Plug>(coc-format-selected)
" nmap <leader>fm  <Plug>(coc-format-selected)

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

autocmd User CocDiagnosticChange call lightline#update()
" }}} coc.nvim

" Neovim LSP {{{
lua <<EOF
--require('nvim-lsp')
EOF
" }}} Neovim LSP

" Easymotion {{{
" s{char}{char} to move to {char}{char} over windows
nmap <Leader>F <Plug>(easymotion-overwin-f)
" Move to line over windows
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Search n-chars
map / <Plug>(easymotion-sn)
" }}} Easymotion

" Multi select {{{
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
" }}} Multi select

" fzf.vim {{{

" Customize fzf colors to match your color scheme
noremap <space>f :Files<CR>
noremap <space>b :Buffers<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

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
" }}} fzf.vim

" Quick Scope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' ctermfg=155
highlight QuickScopeSecondary guifg='#5fffff' ctermfg=81
" }}} Quick Scope

" Lua {{{
lua <<EOF
--require('lualine').setup({
--  options = {
--    globalstatus = true,
--  },
--  sections = {
--    lualine_c = { 'filename', 'g:coc_status' }
--  }
--})

require'nvim-treesitter.configs'.setup {
  context_commentstring = {
      enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {"javascript", "html"},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "java",
    "c",
    "rust",
    "javascript",
    "css",
    "html",
    "cpp",
    "go",
  },
  rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
}

require("telescope").setup({
  defaults = {
    generic_sorter = require('mini.fuzzy').get_telescope_sorter,
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      }
    }
  }
})
require('telescope').load_extension('coc')
require('telescope').load_extension('maple')

require('mini.fuzzy').setup()
require('mini.comment').setup()
--require('mini.surround').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()

require('colorizer').setup()
require('hlargs').setup()
require('remember')

require("nvim-autopairs").setup {}
EOF
" }}} Lua

" Auto close tag {{{
let g:closetag_filenames = '*.html,*.js,*.jsx,*.vue,*.php,*.css,*.scss,*.sass,*.less,*.styl,*.ts,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:jsx_ext_required = 0
" }}} Auto close tag

" autocmd {{{
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

augroup common
  autocmd!
  autocmd BufNewFile,BufRead *.jl setlocal filetype=julia
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
  autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc
  autocmd BufNewFile,BufRead go.work.sum setlocal filetype=gosum
  autocmd BufNewFile,BufRead go.work setlocal filetype=gowork

  autocmd FileType go setlocal expandtab
  autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd FileType lua setlocal includeexpr=substitute(v:fname,'\\.','/','g')
  autocmd FileType lua setlocal include=require
  autocmd FileType lua setlocal define=function
  autocmd FileType markdown setlocal suffixesadd=.md
  autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
  autocmd FileType crontab setlocal nobackup nowritebackup
  autocmd FileType lua,ruby,html,javascript,typescript,css,json,vue,vim,yaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
  autocmd FileType list lua require('bqf.magicwin.handler').attach()

  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd BufReadPost *.log normal! G
  autocmd QuickFixCmdPost cgetexpr cwindow
  autocmd QuickFixCmdPost lgetexpr lwindow

  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd User CocLocationsChange call s:coc_qf_jump2loc(g:coc_jump_locations)

  autocmd BufWritePre *.go silent! :call CocAction('runCommand', 'editor.action.organizeImport')

  " set up default omnifunc
  autocmd FileType *
        \ if &omnifunc == "" |
        \    setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
augroup end
" }}} autocmd

" Neovide {{{
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_input_use_logo=v:true
let g:neovide_cursor_antialiasing=v:true
" let g:neovide_fullscreen=v:true
" }}} Neovide

" Emmet {{{
" let g:user_emmet_settings = {
" \  'php' : {
" \    'extends' : 'html',
" \    'filters' : 'c',
" \    'snippets': {
" \      'pr': "echo '<pre>' . print_r( |, true ) . '</pre>';",
" \      'e': 'echo |;',
" \      'vd': 'var_dump(|);'
" \    }
" \  },
" \  'javascript' : {
" \    'snippets': {
" \      'cl': 'console.log( | );',
" \      'cd': 'console.dir( | );',
" \      'ci': 'console.info( | );',
" \      'cde': 'console.debug( | )'
" \    }
" \  }
" \}
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" let g:user_emmet_mode='a'    "enable all function in all mode.
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" }}} Emmet

" wildignore {{{
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.log,*.pyc,*.sqlite,*.sqlite3,*.min.js,*.min.css,*.tags
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.pdf,*.dmg,*.app,*.ipa,*.apk,*.mobi,*.epub
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*/.git/*,*/.svn/*,*.DS_Store
set wildignore+=*/node_modules/*,*/nginx_runtime/*,*/build/*,*/logs/*,*/dist/*,*/tmp/*
" }}} wildignore

" functions {{{
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
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

function! s:go_to_definition()
  if CocActionAsync('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error"
    call searchdecl(expand('<cword>'))
  endif
endfunction

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

" }}} functions

" vim-gutentags {{{
set tags=./.tags;,.tags
let g:gutentags_project_root = ['.root', '.git', '.svn', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
let g:gutentags_ctags_exclude = ['*.md', '*.json', '*.js', '*.ts', '*.jsx', '*.css', '*.less', '*.sass', '*.go', '*.dart', 'node_modules', 'dist', 'vendor']
" }}} vim-gutentags

" go.vim {{{
let g:go_fmt_command = "gofumpt"
" }}} go.vim

"" Syntax theme "{{{
"" ---------------------------------------------------------------------

"" true color
"if exists("&termguicolors") && exists("&winblend")
"  syntax enable
"  set termguicolors
"  set winblend=0
"  set wildoptions=pum
"  set pumblend=5
"  set background=dark
"  " Use NeoSolarized
"  let g:neosolarized_termtrans=1
"  runtime ./colors/NeoSolarized.vim
"  colorscheme NeoSolarized
"endif

""}}}

"" Extras "{{{
"" ---------------------------------------------------------------------
"set exrc
""}}}

" telescope.nvim {{{
nnoremap <silent><nowait> <M-;> :<C-u>Telescope buffers<CR>
nnoremap <silent><nowait> ` :<C-u>Telescope find_files<CR>
nnoremap <silent><nowait> <space>g  :<C-u>Telescope maple<CR>
nmap g<Enter> :Telescope<CR>
" }}}} telescope.nvim

" vim: set foldmethod=marker foldlevel=0:
