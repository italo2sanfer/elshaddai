" Tecla leader e atalhos
" Trocando a tecla: 'let mapleader = ","'

" Instalando pathogen
" Utiliza os plugins da pasta .vim/bundle
" Deve estar carregado em .vim/autoload
call pathogen#infect()
syntax on
filetype plugin indent on

" Colocar comando na Inicialização
"au VimEnter * LustyFilesystemExplorer
"au VimEnter * NERDTree

" Configurando diretórios
cd /home/italo/Workspace/suap
let g:netrw_keepdir=1

" Ajuda terminal https://vimhelp.org/terminal.txt.html
function CristoReiComandoTerminal(comando)
  " Nova Aba e abertura de terminal
  tabnew|terminal
  " Acha o buffer do terminal
  let lista_buffers_terminal = filter(map(getbufinfo(), 'v:val.bufnr'), 'getbufvar(v:val, "&buftype") is# "terminal"')
  let numero_buffer_terminal = lista_buffers_terminal[0]
  " Envia o comando
  call term_sendkeys(numero_buffer_terminal, a:comando."\<CR>")
  " Fecha a janela que já estava aberta
  wincmd w|bd
endfunction
nmap \gs :call CristoReiComandoTerminal('git status')<CR>
imap \gs <ESC>:call CristoReiComandoTerminal('git status')<CR>
nmap \gd :call CristoReiComandoTerminal('git diff')<CR>
imap \gd <ESC>:call CristoReiComandoTerminal('git diff')<CR>

" Exemplo de comando
"command -nargs=1 MyFunc3 vimgrep <args> ./*/**/*.*

" Configurar o vim-easygrep
" GrepOptions q
" Pode colocar para procurar em todo o path setado no cd

" Resolver Warning do LustyFilesystemExplorer
set hidden

" Vimgrep personalizado
function CristoReiVimgrep(local,modo)
  if a:modo != "v"
    let @l=expand("<cword>")
  endif
  if a:local == "p"
    let @m = split(expand("%p"),"/")[0]
  else
    let @m = a:local
  endif
  tabnew
endfunction
nmap \s :call CristoReiVimgrep("p","")<cr>:vimgrep <c-r>l ./<c-r>m/**/*.*<cr>:copen<cr>/<c-r>l<cr>
nmap \d :call CristoReiVimgrep("*","")<cr>:vimgrep <c-r>l ./<c-r>m/**/*.*<cr>:copen<cr>/<c-r>l<cr>
imap \s <ESC>:call CristoReiVimgrep("p","")<cr>:vimgrep <c-r>l ./<c-r>m/**/*.*<cr>:copen<cr>/<c-r>l<cr>
imap \d <ESC>:call CristoReiVimgrep("*","")<cr>:vimgrep <c-r>l ./<c-r>m/**/*.*<cr>:copen<cr>/<c-r>l<cr>
vmap \s "ly<ESC>:call CristoReiVimgrep("p","v")<cr>:vimgrep "<c-r>l" ./<c-r>m/**/*.*<cr>:copen<cr>/<c-r>l<cr>
vmap \d "ly<ESC>:call CristoReiVimgrep("*","v")<cr>:vimgrep "<c-r>l" ./<c-r>m/**/*.*<cr>:copen<cr>/<c-r>l<cr>

" Abrir navegador de arquivos
nmap \n :NERDTree<CR>
imap \n <ESC>:NERDTree<CR>

" Comentar - Bloco
function CristoReiComentar()
  let line_text = getline('.')
  if line_text[0] == '#'
    s/^#//
  else
    s/^/#/
  endif
endfunction
nmap \m V:call CristoReiComentar()<CR>
vmap \m :call CristoReiComentar()<CR>
imap \m <ESC>V:call CristoReiComentar()<CR>i
" Comentar - Linha Por linha
imap <F3> <c-c>I#<down>
nmap <F3> I#<down><c-c>
imap <F4> <c-c>I<del><down>
nmap <F4> I<del><down><c-c>

nmap \; :
imap \; <ESC>:

" Configurações
set wildignore=*.asta,*.pyc,*.pdf,*.doc,*.xcf,*.png,*.jpg,*.jpeg,*.gif,*.svg,*.mp4,*.mp3,*/cache/*,*/cache_/*,*.ogg,*.tgz,*.webm,*.ttf,*.PDF
"set incsearch hlsearch wildmenu mat=6 tabstop=4 shiftwidth=4 expandtab cursorline mouse=a autoindent nowrap
set incsearch hlsearch wildmenu mat=6 tabstop=2 shiftwidth=2 expandtab cursorline mouse=a autoindent nowrap
syntax on

" Copiar
vmap <c-c> "+y
vmap <c-x> "+x
" Colar
xmap <c-v> <del>i<ESC>"+p<right>i
cmap <c-v> <c-r>+
imap <c-v> <esc>"+p<right>i
" <c-v> no modo normal e a marcacao por colunas
nmap <c-v> "+pi

" Seleciona tudo
nmap <c-a> GVgg
imap <c-a> <esc>GVgg

" Fazer e Desfazer
imap <c-z> <esc>ui
nmap <c-z> u
imap <c-y> <esc><c-r>i
nmap <c-y> <c-r>

" Outros
imap <c-s> <esc>:w<cr>i
nmap <c-s> :w<cr>
imap <c-t> <esc>:tabnew<cr>
nmap <c-t> :tabnew<cr>
imap <c-d> <esc>:bd<cr>
nmap <c-d> :bd<cr>
vmap <bs> <del>

" Busca rapida teclado
imap <c-left> <esc>Ni
nmap <c-left> N
imap <c-right> <esc><right>ni
nmap <c-right> n
imap <c-down> <esc>*i
nmap <c-down> *

" Fechar tudo
imap <c-q> <esc>:qall<cr>
nmap <c-q> :qall<cr>

" Selecionar com o teclado
imap <S-left> <esc>v<left>i
nmap <S-left> v<left>
imap <S-right> <esc>v<right>i
nmap <S-right> v<right>
imap <S-up> <esc>v<up>i
nmap <S-up> v<up>
imap <S-down> <esc>v<down>i
nmap <S-down> v<down>

" Chamar terminal
imap <F3> <esc>:terminal<cr>
nmap <F3> :terminal<cr>

" Buscar
imap <c-f> <esc>/
nmap <c-f> /

if has("gui_running")
  imap <c-o> <esc>:browse confirm e<cr>i
  nmap <c-o> :browse confirm e<cr>
  "imap <c-f> <esc>:promptfind<cr>i
  "nmap <c-f> :promptfind<cr>
  imap <c-h> <esc>:promptrepl<cr>i
  nmap <c-h> :promptrepl<cr>
  amenu icon=/usr/share/icons/hicolor/48x48/apps/xterm-color.png ToolBar.Terminal <esc><c-t>:terminal<cr><c-w>w:bd<cr>
  amenu icon=/usr/share/icons/hicolor/48x48/apps/mate-panel-fish.png ToolBar.LimpaBusca :nohlsearch<cr>
  amenu icon=/usr/share/icons/hicolor/48x48/apps/mate-typing-monitor.png ToolBar.NerdTree :NERDTree<cr>
  amenu icon=/usr/share/icons/hicolor/48x48/apps/mate-typing-monitor.png ToolBar.TabEBrowse :tabnew<cr>:browse confirm e<cr>
  amenu icon=/usr/share/icons/hicolor/48x48/apps/spacefm-48-cube-blue.png ToolBar.QAll :qall<cr>
else
  "nmap <c-o> :e\.<cr>
  nmap <c-o> :LustyFilesystemExplorerFromHere<cr>
  imap <c-o> <ESC>:LustyFilesystemExplorerFromHere<cr>i
endif

" VimFileManager
"nmap <insert> mf<down>|nmap <tab> <c-w>w|let g:netrw_keepdir=0|let g:netrw_localrmdir='rm -rf'
