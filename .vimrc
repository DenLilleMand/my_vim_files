" Author info -----------------------------{{{
"Author:DenLilleMand
"Creation Date: 1st of january,  2015
"Description: Alot of the most popular plugins, mainly javascript focused.
"License: MIT
"}}}
" settings before#vundle -------------------- {{{

"if this wasn't on, we would run in vi-compatible mode.
set nocompatible       

"these two are being turned on when we're behind the 
"vundle installation. aparently it should be a good thing 
"to have set before running vundle, im not entirely sure 
"about the essential reason for it.
filetype off
filetype indent off
filetype plugin indent off



set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/haps/
"}}}
" Vundle ---------------- {{{
call vundle#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins:functional
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"required, vundle is the plugin manager.
Plugin 'gmarik/Vundle.vim'

"adding docs to express
Plugin 'angelozerr/tern-node-express'

Plugin 'mxw/vim-jsx'

"'1. Set paste<CR> turns on paste mode, the reason why we do this, is because 'if we're in insert mode, vim will try to indent, and if we paste allready 'indented code forexample, this will mess up big time..  '2.o<esc> inserts a new line below and goes back into normal mode.  '3."*]p gets the content from the systems clipboard, and pastes it in.  '4.set nopaste<cr> turns paste mode off 

"Plugin 
Plugin 'tpope/vim-unimpaired'


"Solarized theme, the most popular vim theme.
Plugin 'altercation/vim-colors-solarized'

"Do all of your code completions with tab.
Plugin 'ervandew/supertab'

"fuzzy search method completion for vim. Has support for alot of languages. 
"Requires compiling some
"stuff::://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64-super-quick-installation 
Plugin 'Valloric/YouCompleteMe'

Plugin 'Raimondi/delimitMate'

"nerdcommenter 
Plugin 'scrooloose/nerdcommenter'

"tagbar, is a plugin that makes it easy way to provide the tags of the current
"file. And get a overview of its structure. 
"This plugin has a dependency on: sudo apt-get install exuberant-ctags
Plugin 'majutsushi/tagbar'




"Full integration for node in vim, with a bunch of great hotkeys for moving
"around project etc.
Plugin 'moll/vim-node'

"easymotion, is  
Plugin 'Lokaltog/vim-easymotion'
  
"Tabular, pretty nice intro vid at :
"http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'


"ctrlP is a fuzzy search, and enables with ctrl+p, we can search the worktree with it, and find files at insane speeds.   
Plugin  'kien/ctrlp.vim' 
"gives us this nice interface, the contender for 2nd place is something called powerline",
"which is waay more heavy weight, and requires you to install system fonts to work properly. 
"this is the newer and slimmer version, and we even set the theme to powerline, so we get their l&f. 
Plugin 'bling/vim-airline'


"Automatically closes HTML tag once you finish typing it with >. It is also smart enough to not autoclose tags when in a comment,
"when they are self-closing, or when they have already been closed.
Plugin 'amirh/HTML-AutoCloseTag'

"This plugin, makes it easier to wrap text in delimiters such as brackets,
"paratheses, quotations, even a <div> tag would close correctly with this
"syntax. All we have to do is have the cursor on the wrapped word, and then we
"can change the word and what not. 
Plugin 'tpope/vim-surround'

"Allows us to explore the file tree, open files and directories,
"bookmarks,toggle hidden files, it remembers cursor position within files - so
"we can close and reopen and just continue. link to best docs:    http://usevim.com/2012/07/18/nerdtree/
Plugin 'scrooloose/nerdtree'

"Nerdtree and tabs painlessly in vim. Will make sure that 
"its only 1 nerdtree being open all the time, it can be closed in all
"tabs/open in all tabs, can be toggled with :NERDTreeTabsToggle
"When we close a file, nerdtree will close with it, so no more hanging.
""https://github.com/jistr/vim-nerdtree-tabs
Plugin  'jistr/vim-nerdtree-tabs'


"required, fugitive is a git wrapper for vim, so you never have to leave vim to do git commands. github:https://github.com/tpope/vim-fugitive.
Plugin 'tpope/vim-fugitive' 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins:Syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"javascript bundle for vim, this bundle provides syntax and indent plugins. 
Plugin 'pangloss/vim-javascript'


"syntastic, is a plugin that checks the syntax through external checkers.
"syntax errors is help for obvious reasons.
Plugin 'scrooloose/syntastic' 


" end the vundle run.
call vundle#end()            

"}}}
" settings after#vundle ---------------- {{{
filetype on 
filetype indent on
filetype plugin indent on
" }}}
" Pathogen ---------------------- {{{
" Pathogen runtime inject, in practical terms pathogen.vim makes it super easy
" to install plugins and runtime files in their own private repositories.
execute pathogen#infect()

" Adding helptags. makes it possible to run :helptags on every doc/ directory
" in your 'runtimepath'
execute pathogen#helptags()

" }}}
" Basic Settings -------------------------------- {{{
"If this was set to off, the plugins wouldnt be able to do indenting based on
"file type, which is a pretty  big deal i guess? im not sure if some of the
"plugins wouldve overriden this setting anyway?
"filetype indent on

" required, not entirely sure what this does compared to the one above, maybe
" the same just plugin specific.
" filetype plugin indent on    


"Sets it on.
set autoindent

"sets the width of the indentation.
set shiftwidth=2

"Does the right thing (mostly) in programs. When its on it makes it so that
"tabs are calculated from shiftwidth from the beginning of the line, so if
"we're at like 1 it would indent 3. 
set smartindent

"setting the syntax on. 
syntax on  

" Turn on line numbering. Turn it off with 'set nonu'
set nu

"Case insensitive search
set ic 

" Higlhight search
"set hls 

" Wrap text instead of being on one line
set lbr 
"}}}
" Filetype specific settings --------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"The following is really strange rofl, why would 
"the file type be javascript written like that? 
"i thouth it only looked at the postfix, like js, 
"so what happens if we do jsx, or xlsx etc. some of the new 
"file types? then i guess vim will use the postfix if it doesn't 
"exist in their dictionary
augroup filetype_js 
  autocmd!
  autocmd FileType javascript :inoreabbrev <buffer> _author  
  	\/**
  	\<cr>Author: Matti Andreas Nielsen
  	\<cr>License: MIT
  	\<cr>Date:
  	\<cr>Description:
	\<cr>*/
augroup END
" }}}
"Abreviations ---------------------------- {{{
  





" }}}
" Non-Plugin mappings -------------------- {{{
"This maps jk to escape, that makes it hard to write jk, but its better than 'typeing escape each time to leave insert mode, anyway, i feel like ESC is "better suited for saveing+quitting a file, while shift-ESC could be :q!
inoremap jk <ESC>

"Buffer navigation(forward is allready on tab)
noremap <S-tab> :bprevious
noremap <C-1> :bfirst
noremap <C-2> :blast

nnoremap <leader>pb :execute "vsplit " . bufname("#")<cr>

let mapleader="\\"


nnoremap <leader>s :/\v

    
" Open up current file in chrome
nnoremap <silent> <leader>ch :exec 'silent !open -a "Chrome" % &'

"Toggle our TagBar with f8
nnoremap <F8> :TagbarToggle<CR>

"Map <c-u> to back-visual-select eol-caps all, to avoid shift
inoremap <c-u> <esc>0v$U
nnoremap <c-u> 0v$U

"where ever we are, this mapping will allways 
"point to our .vimrc file and open it in a split window.
" the $MYVIMRC is a variable that allways points to our .vimrc file.
nnoremap <leader>ev :vsplit $MYVIMRC <cr>


"whenever we make a mapping, we have to quit vim, and enter again,
"to make that easier we're going to map our :source and give it the .vimrc
"variable as parameter, so each time we do it, we compile our .vimrc.
nnoremap <leader>sv :source $MYVIMRC<cr>


"is suppose to change buffers with tab and shift-tab. would still be nice
"changeing buffers with a number though. Ctrl+p does it with names so thats
"hardly nessecery.  
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>


" }}}
" Tabularize ------------------------- {{{
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>

"}}}
" Nerdtree settings and mappings ------------------- {{{
"NERDTtree= Tabs configuration. 
"NERDTreeTabs on console vim startup
"mapping ctrl n to boot NERDtree
noremap <C-n> :NERDTreeToggle<CR>

"Makes sure that NERDTree closes down aswell, whenever we do wq on the last
"open buffer.
augroup somegroup
  autocmd!
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END

let g:nerdtree_tabs_open_on_console_startup=1


"Open NERDTree on gvim/macvim startup.
let g:nerdtree_tabs_open_on_gui_startup=1


"Close current tab if there is only one window in it and it's NERDTree
let g:nerdtree_tabs_autoclose=1

"Do not open NERDTree if vim starts in diff mode
let g:nerdtree_tabs_no_startup_for_diff=1

"On Startup, focus NERDTree if opening a directory, focus file if opening a
"file. When set to 2, always focus file window after startup. 
let g:nerdtree_tabs_smart_startup_focus=1

"Synchronize view of all NERDTree windows (scroll and cursor position)
let g:nerdtree_tabs_synchronize_view=1

"Synchronize focus when switching windows (focus NERDTree after tab switch if and only if it was focused before tab switch) 
let g:nerdtree_tabs_synchronize_focus=1 

"Open NERDTree on new tab creation (if NERDTree was globally opened by :NERDTreeTabsToggle)
let g:nerdtree_tabs_open_on_new_tab=1

"Unfocus NERDTree when leaving a tab for descriptive tab names
let g:nerdtree_tabs_meaningful_tab_names=1

"When switching into a tab, make sure that focus is on the file window, not in the NERDTree window. (Note that this can get 
"annoying if you use NERDTree's feature 'open in new tab silently', as you will lose focus on the NERDTree.)
let g:nerdtree_tabs_focus_on_files=0

"When given a directory name as a command line parameter when launching Vim, :cd into it.
let g:nerdtree_tabs_startup_cd=1

"Automatically find and select currently opened file in NERDTree.
let g:nerdtree_tabs_autofind=0

"This is suppose to make sure that each time we change the CWD with nerdtree,
"it makes it so that ctrlP only looks for files in that subDirectory with
"fuzzy search. what we should be interested in, would be to figuire out how to
"exclude surden files. like a gitIgnore, forexample if we have a huge library
"in our subdir, like most project folders has, like Node, or something like
"that, usually fuzzy search will find everything, especially with regex. which
"is obviously a problem
let g:NERDTreeChDirMode       = 2


" }}}
" Airline settings and mappings ----------------------- {{{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme='powerlineish'
"let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
"let g:airline#extensions#whitespace#symbol = '!'


let g:airline#extensions#tabline#enabled = 1
"}}}
" Habit breaking - habit making -------------------------- {{{
"http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"}}}
" CtrlP settings and mappings ------------------- {{{

"like a gitignore, just for ctrlP, great for 
"huge sub-directories that we're not interested in, like vendor
"js/css/whatever
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bin'

"This is a setting that works great in combination with nerdtree,
"and it allows us to change 'cwd(working directory)' whenever we change path
"through nerdtree, that means that instead of ctrlP allways searching from
"root, it will search from current CWD.
let g:ctrlp_working_path_mode = 'rw'

"}}}
" EasyMotion mappings ------------------- {{{
let  g:EasyMotion_do_mapping = 1
"}}}
