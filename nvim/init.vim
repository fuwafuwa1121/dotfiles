"基礎設定
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set splitright
set clipboard+=unnamedplus
set hls
set encoding=utf-8
set ambiwidth=double
syntax enable

autocmd FileType javascript set tabstop=2
autocmd FileType typescript set tabstop=2
autocmd FileType typescript set shiftwidth=2
autocmd FileType typescriptreact set tabstop=2
autocmd FileType typescriptreact set shiftwidth=2

"キーマッピング
inoremap <silent> jj <ESC>

"括弧のハイライトを無くす
let loaded_matchparen = 1

"install dein
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

"dein設定
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  "call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif
filetype plugin indent on


nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab


"airline: ステータスラインの設定
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"ファイラーの設定
nnoremap <C-f> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden=1

" アイコンに色をつける
let g:fern#renderer = 'nerdfont'
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"フォント設定
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 14
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

let g:airline_right_sep = '«'
let g:airline_right_sep = '▶'

"括弧の補完
let g:lexima_enable_basic_rules = 1
let g:lexima_enable_newline_rules = 1

"カラースキーム
colorscheme molokai

"フォーマッタ
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \       'html': ['prettier'],
      \       'css': ['prettier'],
      \       'javascript': ['prettier'],
      \       'javascriptreact': ['prettier'],
      \       'typescript': ['prettier'],
      \       'typescriptreact': ['prettier'],
      \       'python': ['flake8'],
      \  }
let g:ale_statusline_format = ['E%d', 'W%d', 'OK']
let g:ale_linters_explicit = 1

"スペルチェック無効
let g:ale_cspell_executable = ''

"scssコンパイラ
"コンパイルの出力先
let g:sass_compile_file = ['css']

"保存時に自動コンパイル
let g:sass_compile_auto = 1

"コンパイルするファイル形式
let g:sass_compile_file = ['scss', 'sass']

"コンパイル後に通知する
let g:sass_compile_aftercmd = "growlnotify -t 'sass-compile.vim' -m ${sasscompileresult}"

"prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
