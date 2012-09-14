# 2ret-vim : Ben Thouret's Vim Distribution

     #######  ########  ######## ########         ##     ## #### ##     ##
    ##     ## ##     ## ##          ##            ##     ##  ##  ###   ###
           ## ##     ## ##          ##            ##     ##  ##  #### ####
     #######  ########  ######      ##    ####### ##     ##  ##  ## ### ##
    ##        ##   ##   ##          ##             ##   ##   ##  ##     ##
    ##        ##    ##  ##          ##              ## ##    ##  ##     ##
    ######### ##     ## ########    ##               ###    #### ##     ##


2ret-vim is a distribution of vim plugins and resources for Vim, Gvim and [MacVim].

The distribution is completely customisable using a `~/.vimrc.local`
and `~/.vimrc.bundles.local` Vim RC files.

![2ret-vim image][2ret-vim-img-1]

# INSTALLATION (Linux, *nix, Mac OSX Installation)

The easiest way to install 2ret-vim is to use our [automatic installer](http://2ret.com/vim)
by simply copying and pasting the following line into a terminal.
This will install 2ret-vim and backup your existing vim configuration.

```bash

    curl http://2ret.com/vim -L -o - | sh

```

## Requirements:

* git (ex: ubuntu `apt-get install git-core`)
* vim (ex: ubuntu `apt-get install vim-nox`)
* curl

## Updating to the latest version

```bash
    cd $HOME/to/2ret-vim/
    git pull
    vim +BundleInstall! +BundleClean +q
```

# OPTIMIZED .vimrc CONFIG FILE

![2ret-vim vimrc image][2ret-vim-img-1]

The .vimrc file is suited to programming. It is well organized and
folds in sections. Each section is labeled and each option is commented.

It fixes many of the inconveniences of vanilla vim including

 * A single config can be used across Windows, Mac and linux
 * Eliminates swap and backup files from littering directories, preferring to store in a central location.
 * Fixes common typos like :W, :Q, etc
 * Setup a solid set of settings for Formatting (change to meet your needs)
 * Setup the interface to take advantage of vim's features including
   * omnicomplete
   * line numbers
   * syntax highlighting
   * A better ruler & status line
   * & more
 * Configuring included plugins

It uses [Vundle] has an excellent system built on the same principles as Pathogen,
but with an integrated plugin management system that is Git and Github aware.

## Customization

Create `~/.vimrc.local` and `~/.gvimrc.local` for any local
customizations.

For example, to override the default color schemes:

```bash
    echo colorscheme ir_black  >> ~/.vimrc.local
```

# PLUGINS

## Adding new plugins

Create `~/.vimrc.bundles.local` for any additional bundles.

To add a new bundle

```bash
    echo Bundle \'2ret-vim/vim-colors\' >> ~/.vimrc.bundles.local
```

Here are a few of the plugins:

## [Surround]

## [Vim-commentary]

## [Neocomplcache]

## [Fugitive]

## [Ack.vim]

## [Tagbar]

Plugin for browsing the tags of source code files.
It provides a sidebar that displays the ctags-generated tags of the current
file, ordered by their scope.

**QuickStart** `CTRL-]` while the cursor is on a keyword (such as a function name)
to jump to it's definition.

**Customizations**: 2ret-vim binds `<F8>` to toggle the tagbar panel

    Install dependency with exuberant ctags

    install http://ctags.sf.net
    ex: ubuntu `sudo apt-get install exuberant-ctags`
    ex: macos `brew install ctags && sudo mv /usr/bin/ctags /usr/bin/ctags.bak`

## [ZoomWin]

## [Ctrlp.vim]

## [Gundo]

# Intro to VIM

Here's some tips if you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides by Drew Neil at [VIM: Walking Without Crutches](http://walking-without-crutches.heroku.com/#1).
* Blog post by Yann Esposito: [Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)
* Blog post by Mislav Marohnić: [Vim: revisited](http://mislav.uniqpath.com/2011/12/vim-revisited/)

## Modes

* VIM has two (common) modes:
  * insert mode- stuff you type is added to the buffer
  * normal mode- keys you hit are interpreted as commands
* To enter insert mode, hit `i`
* To exit insert mode, hit `<ESC>`

## Useful commands

* Use `:q` to exit vim
* Certain commands are prefixed with a `<Leader>` key, which by default maps to `\`.
  2ret-vim uses `let mapleader = ","` to change this to `,` which is in a consistent and
  convenient location.

### Keyboard cheat sheet

[source cheat sheet](http://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png)

![vim cheat sheet image][vim-key-mapping-img]

# CREDITS

Strongly inspired by [spf13-vim : Steve Francia's Vim Distribution](https://github.com/spf13/spf13-vim)

[MacVim]:http://code.google.com/p/macvim/
[spf13-vim]:https://github.com/spf13/spf13-vim
[2ret-vim]:https://github.com/benichu/2ret-vim

[Vundle]:http://github.com/gmarik/vundle
[Vim-commentary]:http://github.com/tpope/vim-commentary
[Neocomplcache]:http://github.com/shougo/neocomvim
[Fugitive]:http://github.com/tpope/vim-fugitive
[Surround]:https://github.com/tpope/vim-surround
[Tagbar]:http://github.com/majutsushi/tagbar
[Syntastic]:http://github.com/scrooloose/syntastic
[Matchit]:http://www.vim.org/scripts/script.php?script_id=39
[Tabularize]:http://github.com/godlygeek/tabular
[Ack.vim]:https://github.com/mileszs/ack.vim
[ZoomWin]:https://github.com/vim-scripts/ZoomWin
[Ctrlp.vim]:https://github.com/kien/ctrlp.vim.git
[Gundo]:https://github.com/sjl/gundo.vim

[vim-key-mapping-img]:http://i.imgur.com/hP67T.png
[2ret-vim-img-1]:http://i.imgur.com/bCtak.png
[2ret-vim-vimrc]:http://i.imgur.com/g4NQI.png
