" * PLUGIN CONFIGS
" buffer list -> number of the buffer to select - instead of Buffer Explorer
nnoremap <leader>l :ls<cr>:b<space>
" quick search across buffers
nnoremap <silent> <leader>b :Buffers<cr>

" file navigation
" recent files via pbogut/fzf-mru.vim
nnoremap <leader>p :FZFMru<cr>
" navigate all files in pwd recursively
nnoremap <leader>f :FZF<cr>-
" open directory navigation drawer
nnoremap <C-n> :NERDTreeToggle<CR> 

" Turn on the Wild menu
set wildmenu
set wildmode=longest:full,full

" YankStack
let g:yankstack_yank_keys = ['y', 'd']
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

" Nerd Tree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" surround.vim config
" Annotate strings with gettext 
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" => Git gutter (Git diff)
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>


" Set font according to system (GUI)
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif
" Disable scrollbars (GUI)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" line numbers
" https://jeffkreeftmeijer.com/vim-number/#hybrid-line-numbers
" :set number relativenumber
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

" mouse on
set ttymouse=xterm2
set mouse=a

augroup GTest
" Add GTestCmd command manually
	autocmd FileType cpp nnoremap <silent> <leader>tt :GTestRun<CR>
	autocmd FileType cpp nnoremap <silent> <leader>tu :GTestRunUnderCursor<CR>
	autocmd FileType cpp nnoremap          <leader>tc :GTestCase<space>
	autocmd FileType cpp nnoremap          <leader>tn :GTestName<space>
	autocmd FileType cpp nnoremap <silent> <leader>te :GTestToggleEnabled<CR>
	autocmd FileType cpp nnoremap <silent> ]T         :GTestNext<CR>
	autocmd FileType cpp nnoremap <silent> [T         :GTestPrev<CR>
	autocmd FileType cpp nnoremap <silent> <leader>tf :FZFGTest<CR>
	autocmd FileType cpp nnoremap <silent> <leader>tj :GTestJump<CR>
	autocmd FileType cpp nnoremap          <leader>ti :GTestNewTest<CR>i
augroup END
