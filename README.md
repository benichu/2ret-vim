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

![2ret-vim vimrc image][2ret-vim-vimrc]

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


    TODO: Add Basic re-Mappings


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

This plugin is a tool for dealing with pairs of "surroundings."  Examples
of surroundings include parentheses, quotes, and HTML tags.  They are
closely related to what Vim refers to as text-objects.  Provided
are mappings to allow for removing, changing, and adding surroundings.

Details follow on the exact semantics, but first, consider the following
examples.  An asterisk (*) is used to denote the cursor position.

      Old text                  Command     New text ~
      "Hello *world!"           ds"         Hello world!
      [123+4*56]/2              cs])        (123+456)/2
      "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
      if *x>3 {                 ysW(        if ( x>3 ) {
      my $str = *whee!;         vlllls'     my $str = 'whee!';

For instance, if the cursor was inside `"foo bar"`, you could type
`cs"'` to convert the text to `'foo bar'`.

There's a lot more, check it out at `:help surround`

## [Vim-commentary]

**QuickStart** `\\\` to comment or uncomment a text selection

## [Neocomplcache]

NeoComplCache is an amazing autocomplete plugin with additional support for snippets.
It can complete simulatiously from the dictionary, buffer, omnicomplete and snippets.

**QuickStart** Just start typing, it will autocomplete where possible

**Customizations**:

 * Automatically present the autocomplete menu
 * Support tab and enter for autocomplete
 * `<C-k>` for completing snippets.

## [Fugitive]

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

**QuickStart** `<leader>gs` to bring up git status

**Customizations**:

 * `<leader>gs` :Gstatus<CR>
 * `<leader>gd` :Gdiff<CR>
 * `<leader>gc` :Gcommit<CR>
 * `<leader>gb` :Gblame<CR>
 * `<leader>gl` :Glog<CR>
 * `<leader>gp` :Git push<CR>
 * :Git ___ will pass anything along to git.

## [Ack.vim]

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack

**QuickStart** :Ack

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

Quickly make the current window zooms into a full screen and when done,
restore the previous set of windows.

**QuickStart** `<leader>z`

## [Ctrlp.vim]

Ctrlp replaces the Command-T plugin with a 100% viml plugin. It provides an intuitive and
fast mechanism to load files from the file system (with regex and fuzzy find),
from open buffers, and from recently used files.

**QuickStart** `<leader>f`

## [Gundo]

[Navigate changes history tree](http://vimcasts.org/episodes/undo-branching-and-gundo-vim/)

**QuickStart** `F5`

# Intro to VIM

Here's some tips if you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides by Drew Neil at [VIM: Walking Without Crutches](http://walking-without-crutches.heroku.com/#1).
* Blog post by Yann Esposito: [Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)
* Blog post by Mislav Marohnić: [Vim: revisited](http://mislav.uniqpath.com/2011/12/vim-revisited/)
* Blog post by Michael Jakl: [Vim Introduction and Tutorial](http://blog.interlinked.org/tutorials/vim_tutorial.html)

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
