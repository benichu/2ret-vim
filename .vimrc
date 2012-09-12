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
    if !exists('g:2ret_bundle_groups')
        let g:2ret_bundle_groups=['general', 'programming', 'ruby', 'javascript', 'html', 'misc']
    endif

    " To override all the included bundles, put
    " g:override_2ret_bundles = 1
    " in your .vimrc.bundles.local file"
    if !exists("g:override_2ret_bundles")

    " General
        if count(g:2ret_bundle_groups, 'general')
            Bundle 'scrooloose/nerdtree'
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'tpope/vim-surround'
            Bundle 'AutoClose'
            Bundle 'kien/ctrlp.vim'
            Bundle 'vim-scripts/sessionman.vim'
            Bundle 'matchit.zip'
            Bundle 'Lokaltog/vim-powerline'
            Bundle 'godlygeek/csapprox'
            Bundle 'jistr/vim-nerdtree-tabs'
            Bundle 'flazz/vim-colorschemes'
            Bundle 'corntrace/bufexplorer'
            Bundle 'mbbill/undotree'
            Bundle 'myusuf3/numbers.vim'
        endif

    " General Programming
        if count(g:2ret_bundle_groups, 'programming')
            " Pick one of the checksyntax, jslint, or syntastic
            Bundle 'scrooloose/syntastic'
            Bundle 'garbas/vim-snipmate'
            Bundle 'spf13/snipmate-snippets'
            " Source support_function.vim to support snipmate-snippets.
            if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
                source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
            endif

            Bundle 'tpope/vim-fugitive'
            Bundle 'scrooloose/nerdcommenter'
            Bundle 'godlygeek/tabular'
            if executable('ctags')
                Bundle 'majutsushi/tagbar'
            endif
            Bundle 'Shougo/neocomplcache'
        endif

    " Javascript
        if count(g:2ret_bundle_groups, 'javascript')
            Bundle 'leshill/vim-json'
            Bundle 'groenewege/vim-less'
            Bundle 'taxilian/vim-web-indent'
        endif

    " HTML
        if count(g:2ret_bundle_groups, 'html')
            Bundle 'amirh/HTML-AutoCloseTag'
            Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
        endif

    " Ruby
        if count(g:2ret_bundle_groups, 'ruby')
            Bundle 'tpope/vim-rails'
            let g:rubycomplete_buffer_loading = 1
            "let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
        endif

    " Misc
        if count(g:2ret_bundle_groups, 'misc')
            Bundle 'tpope/vim-markdown'
            Bundle 'spf13/vim-preview'
            Bundle 'tpope/vim-cucumber'
        endif

    endif
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
