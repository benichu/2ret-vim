" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
"
"    #######  ########  ######## ########         ##     ## #### ##     ##
"   ##     ## ##     ## ##          ##            ##     ##  ##  ###   ###
"          ## ##     ## ##          ##            ##     ##  ##  #### ####
"    #######  ########  ######      ##    ####### ##     ##  ##  ## ### ##
"   ##        ##   ##   ##          ##             ##   ##   ##  ##     ##
"   ##        ##    ##  ##          ##              ## ##    ##  ##     ##
"   ######### ##     ## ########    ##               ###    #### ##     ##
"
"   This is the personal .vimrc file of Ben Thouret.
"
" }
"
" Environment {
    " Basics {
        set nocompatible        " must be first line
        set background=dark     " Assume a dark background
    " }

    " Setup Bundle Support {
    " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }

" }

" Bundles {
    " Deps
        Bundle 'gmarik/vundle'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Bundle 'mileszs/ack.vim'
        elseif executable('ack')
            Bundle 'mileszs/ack.vim'
        endif

    " Use local bundles if available {
        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif
    " }

    " In your .vimrc.bundles.local file"
    " list only the plugin groups you will use
    if !exists('g:two_ret_bundle_groups')
        let g:two_ret_bundle_groups=['general', 'programming', 'ruby', 'javascript', 'html', 'misc']
    endif

    " To override all the included bundles, put
    " g:override_two_ret_bundles = 1
    " in your .vimrc.bundles.local file"
    if !exists("g:override_two_ret_bundles")

    " General
        if count(g:two_ret_bundle_groups, 'general')
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'tpope/vim-surround'
            Bundle 'AutoClose'
            Bundle 'kien/ctrlp.vim'
            Bundle 'matchit.zip'
            Bundle 'Lokaltog/vim-powerline'
            Bundle 'godlygeek/csapprox'
            Bundle 'flazz/vim-colorschemes'
            Bundle 'sjl/gundo.vim'
            Bundle 'tpope/vim-commentary'
            Bundle 'vim-scripts/ZoomWin'
        endif

    " General Programming
        if count(g:two_ret_bundle_groups, 'programming')
            Bundle 'tpope/vim-fugitive'
            Bundle 'godlygeek/tabular'
            if executable('ctags')
                Bundle 'majutsushi/tagbar'
            endif
            Bundle 'Shougo/neocomplcache'
            Bundle 'Shougo/neocomplcache-snippets-complete'
        endif

    " Javascript
        if count(g:two_ret_bundle_groups, 'javascript')
            Bundle 'leshill/vim-json'
            Bundle 'taxilian/vim-web-indent'
            Bundle 'kchmck/vim-coffee-script'
        endif

    " HTML/HAML/CSS
        if count(g:two_ret_bundle_groups, 'html')
            Bundle 'amirh/HTML-AutoCloseTag'
            Bundle 'tpope/vim-haml'
            Bundle 'hail2u/vim-css3-syntax'
        endif

    " Ruby
        if count(g:two_ret_bundle_groups, 'ruby')
            Bundle 'tpope/vim-rails'
            let g:rubycomplete_buffer_loading = 1
            "let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
            Bundle 'tpope/vim-bundler'
        endif

    " Misc
        if count(g:two_ret_bundle_groups, 'misc')
            Bundle 'tpope/vim-markdown'
            Bundle 'spf13/vim-preview'
            Bundle 'mattn/gist-vim'
            Bundle 'mattn/webapi-vim'
        endif

    endif
" }

" General {
    set background=dark         " Assume a dark background
    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    set mouse=a                 " automatically enable mouse usage
    set visualbell              " do not beep
    scriptencoding utf-8
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " always switch to the current file directory.

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set nospell                     " no spelling
    set hidden                      " allow buffer switching without saving

    " Setting up the directories {
    set backup                      " backups are nice ...
    if has('persistent_undo')
        set undofile                "so is persistent undo ...
        set undolevels=1000         "maximum number of changes that can be undone
        set undoreload=10000        "maximum number lines to save for undo on a buffer reload
    endif

" }

" Vim UI {
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        color solarized                 " load a colorscheme
    endif
        let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_visibility="high"
    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    set cursorline                  " highlight current line

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

    set backspace=indent,eol,start  " backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code
    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" }

" Formatting {
    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=2                " use indents of 2 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=2                   " an indentation every four columns
    set softtabstop=2               " let backspace delete indent
    "set matchpairs+=<:>                " match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
    au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
    " add json syntax highlighting
    au BufNewFile,BufRead *.json set ft=javascript
    au BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
" }

" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " disable cursor keys in normal mode
    map <Left>  :echo "no!"<cr>
    map <Right> :echo "no!"<cr>
    map <Up>    :echo "no!"<cr>
    map <Down>  :echo "no!"<cr>

    " The following two lines conflict with moving to top and bottom of the
    " screen
    " If you prefer that functionality, comment them out.
    map <S-H> gT
    map <S-L> gt

    " Stupid shift key fixes
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif

    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    """ Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    "clearing highlighted search
    nmap <leader><space> :nohlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <leader>= <C-w>=

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    "" Windows & Navigation
    " open a new vertical split window and switch to it
    nnoremap <leader>w <C-w>v<C-w>l

    " switch between the currently open buffer and the
    " previous one
    nnoremap <leader><leader> <c-^>

    " Textmate style key mappings for indentation
    nmap <D-[> <<
    nmap <D-]> >>
    vmap <D-[> <gv
    vmap <D-]> >gv

" }

" Plugins {

    " Misc {
        let b:match_ignorecase = 1
    " }

    " Gundo {
        "" gundo plugin shortcut
        nnoremap <F5> :GundoToggle<CR>
    " }

    " ZoomWin {
        map <leader>z :ZoomWin<CR>
    " }

    " OmniComplete {
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,preview,longest
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags
        "" look here for tags generated from Gemfile.lock
        set tags+=gems.tags
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " Gist {
        if executable("pbcopy")
            " The copy command
            let g:gist_clip_command = 'pbcopy'
        elseif executable("xclip")
            " The copy command
            let g:gist_clip_command = 'xclip -selection clipboard'
        elseif executable("putclip")
            " The copy command
            let g:gist_clip_command = 'putclip'
        end

        " detect filetype if vim failed auto-detection.
        let g:gist_detect_filetype = 1
        " open browser after the post
        let g:gist_open_browser_after_post = 1
        let g:gist_private = 1
    " }

    " Ack.vim {
        " :Ack the word under the cursor recursively and open the location list.
        nnoremap <leader>fw :silent Ack! \\b<C-r><C-w>\\b<Bar>:lwindow<CR>
        vnoremap <leader>fw "zy:silent Ack! <C-r>z<Bar>:lwindow<CR>
    " }

    " Powerline {
        if has('gui_running')
          " Powerline configuration
          " https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
          set guifont=Menlo\ for\ Powerline
          let g:Powerline_symbols = 'fancy'
        endif
    " }

    " Tabularize {
        if exists(":Tabularize")
          nmap <leader>a= :Tabularize /=<CR>
          vmap <leader>a= :Tabularize /=<CR>
          nmap <leader>a: :Tabularize /:<CR>
          vmap <leader>a: :Tabularize /:<CR>
          nmap <leader>a:: :Tabularize /:\zs<CR>
          vmap <leader>a:: :Tabularize /:\zs<CR>
          nmap <leader>a, :Tabularize /,<CR>
          vmap <leader>a, :Tabularize /,<CR>
          nmap <leader>a<Bar> :Tabularize /<Bar><CR>
          vmap <leader>a<Bar> :Tabularize /<Bar><CR>

          " The following function automatically aligns when typing a
          " supported character
          inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

          function! s:align()
              let p = '^\s*|\s.*\s|\s*$'
              if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
                  let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
                  let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
                  Tabularize/|/l1
                  normal! 0
                  call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
              endif
          endfunction

        endif
     " }

     " ctrlp {
        let g:ctrlp_map = '<c-p>' " mapping to invoke |CtrlP| in |Normal| mode
        let g:ctrlp_working_path_mode = 'rc'
        let g:ctrlp_max_height = 20 " maximum height of the match window
        let g:ctrlp_dotfiles = 0 " don’t want to search for dotfiles and dotdirs
        let g:ctrlp_custom_ignore = {
              \ 'dir':  '\.git$\|\.hg$\|\.svn$\|db/sphinx/*\|\.build$\|build$\|Build$\|\.cache$\|cache$\|Cache$',
              \ 'file': '\.log$\|\.pid$\|\.png$\|\.jpg$\|\.gif$\|\.class$\|\.pyc$\|\.tar.gz|\.swp$',
              \ }
     "}

     " TagBar {
        nmap <F8> :TagbarToggle<CR>
        let g:tagbar_usearrows = 1
     "}

     " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
     "}

     " neocomplcache {
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_enable_auto_delimiter = 1

        " AutoComplPop like behavior.
        let g:neocomplcache_enable_auto_select = 0

        " SuperTab like snippets behavior.
        imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " Plugin key-mappings.
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neocomplcache_snippets_expand)
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()


        " <CR>: close popup
        " <s-CR>: close popup and save indent.
        inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

     " }

" }

" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " remove the toolbar
        set lines=40                " 40 lines of text instead of 24,
        set linespace=2
        set cursorline
        set antialias
        if has("gui_gtk2")
            set guifont=Monaco\ 15,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        else
            set guifont=Monaco:15,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        endif
        if has('gui_macvim')
            " Fullscreen takes up entire screen
            set fuoptions=maxhorz,maxvert
            " Automatically resize splits when resizing MacVim window
            autocmd VimResized * wincmd =
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
" }

 " Functions {

function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

" Automatically Strip trailing whitespace on save
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

" Use local gvimrc if available and gui is running {
    if has('gui_running')
        if filereadable(expand("~/.gvimrc.local"))
            source ~/.gvimrc.local
        endif
    endif
" }
