"
"
call plug#begin('~/.vim/plugged')

"   " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"   Plug 'junegunn/vim-easy-align'
"
"   " Any valid git URL is allowed
"   Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"   " Multiple Plug commands can be written in a single line using |
"   separators
"   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"   " On-demand loading
"   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-eunuch'
Plug 'honza/vim-snippets'
Plug 'rust-lang/rust.vim'
Plug 'kassio/neoterm'

"
"   " Using a non-master branch
"   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"   Plug 'fatih/vim-go', { 'tag': '*' }
"
"   " Plugin options
"   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"   " Plugin outside ~/.vim/plugged with post-update hook
Plug 'tpope/vim-sensible'
"Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'Rigellute/rigel'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

"
"Plug 'tpope/vim-fugitive.git'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"   " Unmanaged plugin (manually installed and updated)
"   Plug '~/my-prototype-plugin'
"
call plug#end()


" SANE DEFAULTS
set relativenumber
set termguicolors
set number
let mapleader = ","
set noswapfile
set undofile
set noshowcmd
let g:gruvbox_contrast_dark='medium'
set hidden " TextEdit might fail if hidden is not set.
set nobackup " Some servers have issues with backup files, see #649.
set nowritebackup
set updatetime=100 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
colorscheme gruvbox " let g:gruvbox_contrast_light='soft'

" colorscheme rigel
" set cmdheight=2 Give more space for displaying messages.
 
" SANE MAPPINGS
inoremap jk <Esc>
nnoremap jk <Esc>
vnoremap jk <Esc>


" Navigation & shortcuts
" General principles for this config
"
" Use alt for split - resize, view change, new create, etc
" Use leader<,> for -
" Use t j|k|t etc for tabs related things

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""" SPLITS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"" navigation

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"" rust run

" nnoremap <A-r> :bel :sp<CR>:terminal cargo run<CR>:resize -15<CR>
nnoremap <A-q> :q<CR>

" FZF to open files
" Open files in horizontal split
"
nnoremap <A-s> h :call fzf#run({'down': '50%','sink':'botright split'})<CR>
" Open files in vertical horizontal split
"
nnoremap <A-v> :call fzf#run({'right': winwidth('.') / 1, 'sink':'vertical botright split'})<CR>

nnoremap <A-n> :nohl<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""" TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap tt :tabnew<CR>:CocList files<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""" LEADER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>co :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <leader>p :CocList files<cr>
nnoremap <leader>o :CocList buffers<cr>
nnoremap <leader>s :CocList -I symbols<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""AUTOCMD

autocmd FileType rust let b:coc_pairs_disabled = ["'"]
let g:rustfmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""" ---- COC SNIPPETS

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'





"""""""""""""""""""""""""""""""""""""""""""""""" ---- COC
" 1. <tab> for autocomplete
" 3. g d/y/i/r code navigation
" 2. <c-space> for triggering options
" 4. <leader-f> formatting selection
" 5. <leader-rn> renaming symbol
" 3. K for opening documentation
" 4. g[] to traverse diagnostic
"
"
" fzf.vim configurations
"
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
nnoremap <leader><leader> :CocListResume symbols<cr>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-suuace> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" turned this off as was not user of its performance impact
" autocmd CursorHold * silent call CocActionAsync('highlight')<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> M <C-w>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = '20'
let g:neoterm_automap_keys = '<leader>tm'
let g:neoterm_use_relative_path = 1
let g:neoterm_autoscroll = 1

xmap <leader>ts <plug>(neoterm-repl-send)
nmap <leader>ts <plug>(neoterm-repl-send)
nmap <leader>tsl <plug>(neoterm-repl-send-line)

nnoremap <silent> <leader>tR :<c-u>exec printf("%sTexec !! \<lt>cr>", v:count)<cr>
nnoremap <silent> <leader>tt :<c-u>exec printf('%sTtoggle', v:count)<cr>
nnoremap <silent> <leader>vt :<c-u>exec printf('botright vertical %s Ttoggle', v:count)<cr>
nnoremap <silent> <leader>ht :<c-u>exec printf('botright %s Ttoggle', v:count)<cr>
nnoremap <silent> <leader>te :<c-u>exec printf('%sT exit', v:count)<cr>
nnoremap <silent> <leader>tl :<c-u>exec printf('%sTclear', v:count)<cr>
nnoremap <silent> <leader>tL :<c-u>exec printf('%sTclear!', v:count)<cr>
nnoremap <silent> <leader>tk :<c-u>exec printf('%sTkill', v:count)<cr>

nnoremap <A-r> :1Tclear<CR>:1T cargo run<CR>

nnoremap <a-1> :1Ttoggle<CR>
nnoremap <a-2> :2Ttoggle<CR>
nnoremap <a-3> :3Ttoggle<CR>
nnoremap <a-4> :4Ttoggle<CR>
cabbrev xh botright Ttoggle
cabbrev xv botright vertical Ttoggle
cabbrev xt botright vertical T

""""""""""""""""""""""""""""""""""DEAD""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" trying out leaderF, i am not fond of fzf in vim
"let g:Lf_CommandMap = {'<C-x>': ['<C-s>'], '<C-]>': ['<C-v>']}

"nnremap <space>f :LeaderfFunctionAll<cr>
" nnoremap <space>b :LeaderfBufferAll<cr>
" nnoremap <space>e :LeaderfFileFullScreen<cr>
" nnoremap <space>m :LeaderfMru<cr>
" nnoremap <space>l :LeaderfLineAll<cr>
" nnoremap <space>c :LeaderfColorScheme<cr>
" I tried leaderF but it gives files which are now deleted as well
" there must be another option for coc does the same work as well
" so why not use one thing less
" why is it enabled by default
" autocomplete braces
" works but trying auto_pairs instead

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

