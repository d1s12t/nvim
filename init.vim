
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""==>>Auto load for the first time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""==>>Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
set number
set relativenumber
set cursorline
set mouse=a
set hidden
set background=dark
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set splitright
set splitbelow
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set linebreak
set wrap
set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start
set textwidth=0
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup
set directory=~/.config/nvim/tmp/backup
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

" Compile function
noremap run :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'lua'
		exec "!lua %"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


 
 " add "Basic Settings" before this line



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""==>>Terminal Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" add "Terminal Settings" before this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""==>>Basic Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
noremap <silent> <LEADER>o za

" find and replace
noremap \s :%s///g<left><left><left>

" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q!<CR>
noremap W :w!<CR>

" Quickly edit vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap re :source $MYVIMRC<CR>

" Clipboard mappings
nnoremap Y y$
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" stop search highlight
noremap <LEADER><CR> :nohlsearch<CR>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap <LEADER>sl :set splitright<CR>:vsplit<CR>
noremap <LEADER>sh :set nosplitright<CR>:vsplit<CR>
noremap <LEADER>sk :set nosplitbelow<CR>:split<CR>
noremap <LEADER>sj :set splitbelow<CR>:split<CR>

" moving the cursor around windows
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

" tab management
noremap tn :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" Cursor movement

" all mode
noremap <A-h> <Left>
noremap <A-j> <Down>
noremap <A-k> <Up>
noremap <A-l> <Right>
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
cnoremap <A-h> <Left>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-l> <Right>

" insert mode
inoremap <C-a> <ESC>^i
inoremap <C-e> <ESC>$a

" normal mode
nnoremap <silent> <C-a> ^
nnoremap <silent> <C-e> $
nnoremap <silent> H 5h
nnoremap <silent> J 5j
nnoremap <silent> K 5k
nnoremap <silent> L 5l

" show path
noremap \p :echo expand('%:p')<CR>


" add "Basic Mappings" before this line



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""==>>My Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open lazygit
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" InsertMap For Enter: 
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    " 补全菜单
    if pumvisible()
        return "\<C-y>"
    " 自动缩进大括号 {}
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction

" add "My Mappings" before this line



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""==>>Plug Install
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" File navigation
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
" Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Markdown
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ferrine/md-img-paste.vim'
" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'mg979/vim-visual-multi' "多光标插件
Plug 'tomtom/tcomment_vim'    "代码注释插件
Plug 'svermeulen/vim-subversive'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'RRethy/vim-illuminate'  " 突出显示(下划线)与光标所在相同的词
Plug 'liuchengxu/vista.vim'
Plug 'lambdalisue/suda.vim'    "权限提升插件
Plug 'skywind3000/vim-terminal-help' "终端助手

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'kshenoy/vim-signature'
Plug 'mg979/vim-xtabline'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-python --enable-bash'}


" add "Plug Install" before this line

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""==>>Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fzf settings
set rtp+=/home/feng/.myconfig/zshconfig
let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-c> :Rg<CR>
noremap <silent> <C-h> :History<CR>
noremap <silent> <C-b> :Buffers<CR>
noremap <leader>; :History:<CR>

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" leaderf settings
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0
nnoremap <c-p> :Leaderf file<CR>

" vim-signature settings
let g:bookmark_no_default_key_mappings = 1
nnoremap mt <Plug>BookmarkToggle
nnoremap ma <Plug>BookmarkAnnotate
nnoremap ml <Plug>BookmarkShowAll
nnoremap mi <Plug>BookmarkNext
nnoremap mn <Plug>BookmarkPrev
nnoremap mC <Plug>BookmarkClear
nnoremap mX <Plug>BookmarkClearAll
nnoremap mu <Plug>BookmarkMoveUp
nnoremap me <Plug>BookmarkMoveDown
nnoremap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1

" Scheme settings
colorscheme gruvbox
set background=dark

" Fzf settings

" Coc settings
let g:coc_global_extensions = [
			\'coc-explorer',
			\'coc-translator',
			\'coc-tsserver',
			\'coc-prettier',
			\'coc-python',
			\'coc-pyright',
			\'coc-phpls',
			\'coc-clangd',
			\'coc-emmet',
			\'coc-highlight',
			\'coc-pairs',
			\'coc-explorer',
			\'coc-snippets',
			\'coc-yank',
			\'coc-git']
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.config/nvim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" 使用<C-s>触发补全
inoremap <silent><expr> <C-s> coc#refresh()
" 回车确认
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)
" Coc-pairs settings
autocmd FileType vim let b:coc_pairs_disable = ['"']

noremap <silent> gd <Plug>(coc-definition) " 跳转到定义
noremap <silent> gi <Plug>(coc-implementation) "跳转到实现
noremap <silent> gr <Plug>(coc-references) "跳转到引用
noremap <silent> gty <Plug>(coc-type-definition) " 跳转到类型定义
noremap <silent> gne <Plug>(coc-diagnostic-next) 
noremap <silent> gle <Plug>(coc-diagnostic-prev)
noremap <leader>rn <Plug>(coc-rename) " 重命名变量

nnoremap <silent> <leader>0 :call <SID>show_documentation()<CR> "预览窗口查看帮助文档"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 变量重命名

" 格式化选中的代码
xnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)
" coc-snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-K>'
xnoremap <leader>x  <Plug>(coc-convert-snippet) "添加选中文本到snippets


"function! s:cocActionsOpenFromSelected(type) abort
"  execute 'CocCommand actions.open ' . a:type
"endfunction
"xmap <leader>te <Plug>(coc-codeaction-selected)
"nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" coc-explorer
nnoremap <space>ed :CocCommand explorer --preset <CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>
nnoremap <silent><nowait> <space>cld  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>cle  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>clc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>clo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>cls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Rnvimr settings
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" Vim-illuminate settings
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" Suda.vim
cnoreabbrev sw w suda://%

" Xtabline settings
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
" noremap to :XTabCycleMode<CR>

" md-img-paste settings
autocmd FileType markdown nmap <buffer><silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = '.'
let g:mdip_imgname = 'image'
"
" vim-table-mode settings
autocmd FileType markdown TableModeEnable

" Tcommant_vim settings
nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

" vim-subversive settings
nnoremap so s
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap se <plug>(SubversiveSubstituteToEndOfLine)

" vim-markdown-toc
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" let g:vmt_auto_update_on_save = 1
" let g:vmt_dont_insert_fence = 1
nnoremap <silent> toc :GenTocGFM

" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''

" other markdown settings

autocmd Filetype markdown inoremap <buffer> ]b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ]d ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ]i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ]n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ]s `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ]l ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ]m - [ ] 
autocmd Filetype markdown inoremap <buffer> ]p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ]a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ]1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ]2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ]3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ]4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ]l --------<Enter>

autocmd Filetype markdown inoremap <buffer> ]f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ]w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>

autocmd Filetype markdown inoremap <buffer> 」b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> 」d ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> 」i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> 」n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> 」s `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> 」l ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> 」m - [ ] 
autocmd Filetype markdown inoremap <buffer> 」p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> 」a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> 」1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> 」2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> 」3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> 」4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> 」l --------<Enter>

autocmd Filetype markdown inoremap <buffer> 」f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> 」w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>


" Rainbow settings
let g:rainbow_active = 1

" Undotree settings
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" Bullets settings
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]
let g:VM_mouse_mappings = 1

" vim-visual-multi
nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)
nmap   <C-A-RightMouse>      <Plug>(VM-Mouse-Column)

" coc-translator
nmap ts <Plug>(coc-translator-p)

" vim-hexokinase settings
let g:Hexokinase_highlighters = ['virtual']

" far settings
let g:far#enable_undo=1

" vista settings
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" vimspector settings
let g:vimspector_enable_mappings = 'HUMAN' "使用官方快捷键
function! s:read_template_into_buffer(template) "加载模板文件
	" has to be a functio                                                             n to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" add "Plugin settings" before this line



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""==>>Plugin Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim-bookmarks Mappings

" 在当前行添加/删除书签
nmap <Leader><Leader> <Plug>BookmarkToggle 
" 在当前行添加/编辑/删除注释
nmap <Leader>ba <Plug>BookmarkAnnotate
" 显示所有书签'
nmap <Leader>bl <Plug>BookmarkShowAll
" 下一个书签
nmap <Leader>bj <Plug>BookmarkNext
" 上一个书签
nmap <Leader>bk <Plug>BookmarkPrev
" 清除缓冲区中的书签
nmap <Leader>bcc <Plug>BookmarkClear
" 清除所有缓冲区中的书签
nmap <Leader>bca <Plug>BookmarkClearAll
" 在当前行上移书签
nmap <Leader>bmj <Plug>BookmarkMoveUp
" 在当前行下移书签
" nmap <Leader>bmk <Plug>BookmarkMoveDown
" 将当前书签移动到另一行
" nmap <Leader>bmn <Plug>BookmarkMoveToLine

" add "Plugin Mappings" before this line
