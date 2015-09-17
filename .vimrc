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

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " must be first line
        if !WINDOWS()
            set shell=/bin/sh
        else
            set shell=/bin/bash
        endif
    " }

    " Setup Bundle Support {
    " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype on
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }

" }

" Bundles {
    " Use local bundles if available {
        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif
    " }
    " Use bundles config {
        if filereadable(expand("~/.vimrc.bundles"))
            source ~/.vimrc.bundles
        endif
    " }
" }

" General {
    set nomodeline
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    set mouse=a                 " automatically enable mouse usage
    set visualbell              " do not beep
    scriptencoding utf-8

    if $TMUX == '' " Fix for `E353: Nothing in register *` when using vim inside tmux
      if LINUX()   " On Linux use + register for copy-paste
          set clipboard=unnamedplus
      else         " On mac and Windows, use * register for copy-paste
          set clipboard=unnamed
      endif
    endif

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set nospell                     " no spelling
    set hidden                      " allow buffer switching without saving

    " Setting up the directories
    set backup                      " backups are nice ...
    if has('persistent_undo')
        set undofile                "so is persistent undo ...
        set undolevels=1000         "maximum number of changes that can be undone
        set undoreload=10000        "maximum number lines to save for undo on a buffer reload
    endif

" }

" Vim UI {
    " Default theme is solarized
    let g:solarized_termcolors=256
    colorscheme solarized
    let g:solarized_termtrans=1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"

    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    set cursorline                  " highlight current line
    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    " avoiding annoying CSApprox warning message
    let g:CSApprox_verbose_level = 0

    if has('statusline')
        set laststatus=2
        set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)"

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
    set relativenumber              " User relative numbers by default
    set number                      " Line numbers on
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
    " List chars
    set listchars=""                  " Reset the listchars
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    let g:netrw_liststyle=3 " netrw tree style listing
" }

" Formatting {
    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=2                " use indents of 2 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=2                   " an indentation every four columns
    set softtabstop=2               " let backspace delete indent
    "set matchpairs+=<:>                " match, to be used with %
    set pastetoggle=<F2>            " pastetoggle (sane indentation on pastes)

    " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
    au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru}    set ft=ruby
    au BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
    autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
    autocmd Filetype perl setlocal ts=4 sts=4 sw=4
" }

" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " disable cursor keys in normal mode
    map <Left>  :echo "use h!"<cr>
    map <Right> :echo "use l!"<cr>
    map <Up>    :echo "use k!"<cr>
    map <Down>  :echo "use j!"<cr>

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
    nmap <silent> <leader><space> :set invhlsearch<CR>

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


    "" Paste/Nopaste Switcher
    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2>
" }

" Plugins {

    " Extradite {
        nnoremap <F6> :Extradite<CR>
    " }

    " Misc {
        let b:match_ignorecase = 1
    " }

    " UndoTree {
        nnoremap <F5> :UndotreeToggle<CR>
        let g:undotree_SetFocusWhenToggle=1 " if undotree is opened, it is likely one wants to interact with it.
    " }

    " Jacinto {
        nnoremap <F12> :Jacinto validate<CR>
    " }

    " ZoomWin {
        map <leader>z :ZoomWin<CR>
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags
        "" look here for tags generated from Gemfile.lock
        set tags+=gems.tags
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
        nnoremap <leader>a :Ack!
        " run Ack against word under cursor
        nnoremap <leader>A :Ack! <c-r><c-w><CR>
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
        let g:ctrlp_cmd = 'exe "CtrlP".get(["", "Buffer", "MRU"], v:count)' " default command used for the default mapping
        let g:ctrlp_max_height = 20 " maximum height of the match window
        let g:ctrlp_dotfiles = 0 " don’t want to search for dotfiles and dotdirs
        let g:ctrlp_mruf_relative = 1 " show only MRU files in the working directory
        let g:ctrlp_custom_ignore = {
              \ 'dir':  '\.git$\|\.hg$\|\.svn$\|tmp$\|db/sphinx/*\|\.build$\|build$\|Build$\|dist$\|\.cache$\|cache$\|*cache$\|Cache$\|_site$\|node_modules$\|bower_components$\|docco$',
              \ 'file': '\.log$\|\.pid$\|\.png$\|\.jpg$\|\.gif$\|\.class$\|\.pyc$\|\.tar.gz|\.swp$\|tags|\.tags$',
              \ }
        " ctrlp Funky
        nnoremap <Leader>fu :CtrlPFunky<Cr>
        " narrow the list down with a word under cursor
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
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
        nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
        nnoremap <silent> <leader>gg :GitGutterToggle<CR>
     "}

     " neocomplete {
        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_auto_delimiter = 1
        let g:neocomplete#max_list = 15
        let g:neocomplete#force_overwrite_completefunc = 1
        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplete#undo_completion()
        inoremap <expr><C-l>     neocomplete#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          return pumvisible() ? neocomplete#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplete#close_popup()
        inoremap <expr><C-e>  neocomplete#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif
        let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        " FIXME: I had to disable this, it was too slow to use in some edge case
        " Example in a gem's engine.rb file, typing the gem's namespace then `:` causes 100% CPU
        " let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

        "" vim-airline
        let g:airline_powerline_fonts = 1

        "" vim-markdown
        let g:vim_markdown_folding_disabled=1

        " TMUX
        if count(g:two_ret_bundle_groups, 'tmux')
            " Turbux
            " http://joshuadavey.com/post/15619414829/faster-tdd-feedback-with-tmux-tslime-vim-and
            let g:no_turbux_mappings = 'no'
            let g:turbux_command_prefix = 'bundle exec'

            function! Run_all_specs()
              if filereadable("./zeus.json")
                return Send_to_Tmux("zeus rspec spec\n")
              elseif filereadable("./bin/rspec_all")
                return Send_to_Tmux("./bin/rspec_all\n")
              elseif filereadable("./bin/rspec")
                return Send_to_Tmux("bin/rspec spec\n")
              else
                return Send_to_Tmux("rspec spec\n")
              endif
            endfunction

            nmap <leader>r <Plug>SendTestToTmux
            nmap <leader>R <Plug>SendFocusedTestToTmux
            nmap <leader>g :call Run_all_specs()<cr>
        end

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
        if LINUX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif OSX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
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
            let g:CSApprox_konsole = 1
        endif
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
"

"" FIXME: Needs to be applied last, or does not work.
set background=dark         " Assume a dark background
