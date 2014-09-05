syntax on
"タブ設定
""" Number of speces that a <Tab> in the file counts for
"set tabstop=4 shiftwidth=2 softtabstop=2 textwidth=0
set tabstop=4
set shiftwidth=4
set softtabstop=0
""" Use the appropriate number of spaces to insert a <Tab>
"set expandtab
"vimgrep で別ウィンドウが開く
autocmd  QuickFixCmdPost *grep* cwindow
"quickrun を横に表示する
let g:quickrun_config={
\	'_' : {
\		'split': 'vertical',
\		'cmdopt': '-Ilib',
\	},
\}
"splitは下にvsplitは右に表示
set splitbelow
set splitright

"ファイルを閉じた場所を記録
if has("autocmd")
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line ("'\"") <= line("$") |
		\   exe "normal! g'\"" |
		\ endif
endif

set nocompatible
filetype plugin indent off

"# 配置先のディレクトリを作成
"$ mkdir -p ~/.vim/bundle
"# NeoBundleをリポジトリから取得
"$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

":NeoBundleInstall でインストルできる
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic.git'
"NERDTree とうつ
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-perl/vim-perl'
".local.vimrcを読むようになる
NeoBundle 'thinca/vim-localrc'
":Ref perldoc strictでカーソルを合わせたモジュールのperldocをひらく
"gfでそのソースを開ける
NeoBundle 'thinca/vim-ref'

"syntastic on
let g:syntastic_enable_signs=1
let g:syntastic_enable_perl_checker=1
let g:syntastic_perl_checkers=["perl", "podchecker"]
"node npm をインストールしてjshintを入れる必要がある
"sudo npm install jshint -g 
let g:syntastic_enable_javascript_checker=1
let g:syntastic_javascript_checkers=["jshint"]
let g:syntastic_auto_loc_list=2

"http://qiita.com/alpaca_taichou/items/056a4c42fe7a928973e6
"div>ul>li <C-y>, とかでうまいことしてくれる
NeoBundle 'mattn/emmet-vim'
"vで選択して　S'とかする
NeoBundle 'tpope/vim-surround'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

"jiangmiao/simple-javascript-indenter setting
let g:SimpleJsIndenter_BriefMode = 1

"NERDTreeSetting
nmap <Leader>t :NERDTree<Enter>




".t ファイルなどをperlのファイルとみなすようにする
augroup filetypedetect
 au BufNewFile, BufRead *.psgi  setf perl
 au BufNewFile, BufRead *.t  setf perl
 au BufNewFile, BufRead *.tt  setf tt2html
 au BufNewFile, BufRead *.tt2  setf tt2html
 au BufNewFile, BufRead cpanfile  setf perl
augroup END

"空のファイルを作成したときのテンプレート
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.template
autocmd BufNewFile *.t 0r $HOME/.vim/template/perl-test.template

"" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
""my snippets
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set nocp
filetype plugin on
filetype plugin indent on     " required!
filetype indent on

nmap <Leader>r <Plug>(quickrun)

"smart move
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

"ハイライトを消す
map <C-M> :noh<CR>

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

""" Precede each line with its line number
set number
""" Don't give the intro message when starting Vim
set shortmess+=I
""" Print the current language
" language en
""" tags
set tags=tags;/

""" Incremental search
set incsearch
""" hilight with searching
set hlsearch
""" The case of normal letters is ignored
set ignorecase
""" Override the 'ignorecase' option if the search pattern contains upper case
"   characters
set smartcase
""" Copy indent from current line when starting a new line
set autoindent
""" Do smart autoindenting when starting a new line
" set smartindent
""" Do autoindenting when starting a new line according the C indenting rules
set cindent
""" List of directories for the backup file, separated with commas
"set backupdir=$HOME/.tmp/
""" When a bracket is inserted, briefly jump to the matching one
set showmatch
""" Command-line completion operates in an enhanced mode
set wildmenu
""" What bases Vim will consider for numbers when using the CTRL-A and CTRL-X
"   commands
set nrformats-=octal
""" Display unprintable characters
set list
""" Strings to use in 'list' mode
set listchars=tab:^-,extends:<,trail:^ ",eol:^
""" Searches do not wrap around the end of the file.
set nowrapscan
""" same as ":set backspace=indent,eol,start"
set backspace=2

set encoding=utf-8
set fileencoding=utf-8
