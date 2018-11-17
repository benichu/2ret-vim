# 2ret-vim : Ben Thouret's Vim Distribution

![2ret-vim image][2ret-vim-img-1]

2ret-vim is a distribution of vim plugins and resources for Vim, Gvim and [MacVim].

The distribution is completely customisable using a `~/.vimrc.local`
and `~/.vimrc.bundles.local` Vim RC files.

# INSTALLATION (Linux, Mac OSX Installation)

The easiest way to install 2ret-vim is to use our [automatic installer](http://2ret.com/vim)
by simply copying and pasting the following line into a terminal.
This will install 2ret-vim and backup your existing vim configuration.

```bash
    curl http://2ret.com/vim -L -o - | sh
```

## Requirements:

* git (ex: ubuntu `apt-get install git-core`)
* nvim 0.3.1+ _with lua and python support_
* curl

On Mac OSX, with homebrew, you would do something like this to reinstall your terminal vim with lua support:

```bash
$ brew install neovim
```

## Updating to the latest version

The simpliest (and safest) way to update is to simply rerun the installer.
It will completely and non destructively upgrade to the latest version.

```bash
    curl http://2ret.com/vim -L -o - | sh
```

Alternatively you can manually perform the following steps.
If anything has changed with the structure of the configuration you will need to create the appropriate symlinks.

```bash
    cd $HOME/.2ret-vim/
    git pull
    vim +PluginInstall! +PluginClean +qall
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
   * code completion
   * line numbers
   * syntax highlighting
   * A better ruler & status line
   * & more
 * Configuring included plugins
 * Automatically remove trailing whitespaces when saving a file

It uses [Vundle] which has an excellent system built on the same principles as Pathogen,
but with an integrated plugin management system that is Git and Github aware.

## Some Basic Mappings

The `leader` key is mapped to `,`

* `<leader><leader>`            - switch between the currently open buffer and the previous one
* `<leader><space>`             - remove search highlighting
* `<leader>w`                   - open a new vertical split window and switch to it
* `<leader>z`                   - zoom In/Out current window
* `Y`                           - yank from cursor to end of line
* `arrows`                      - inactive, please use `h,j,k,l`

### Function Keys Mappings

* `F2`  - when you want to paste something in terminal, toggle to paste mode
* `F5`  - toggle the undotree panel
* `F6`  - open extradite for the current file
* `F8`  - toggle the tagbar panel
* `F12` - validate the current buffer as json

### Vim in the Terminal with [Tmux](https://tmux.github.io/)

    TODO: Tricks, gotchas (cut/paste, etc...)

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

Then to install or update bundles and remove obsolete ones:
```bash
vim +PluginInstall! +PluginClean +qall
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

**QuickStart** `gcc` to comment or uncomment a text selection

Want to comment 3 lines? Try `3gcc`

## [Deoplete]

Neocomplete is an autocomplete plugin.
It can complete simultaniously from the dictionary, buffer, omnicomplete.

**QuickStart** Just start typing, it will autocomplete where possible

**Customizations**:

 * Automatically present the autocomplete menu
 * Support tab and enter for autocomplete

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
 * :Git will pass anything along to git.

For more: [vimcast: Fugitive](http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/)

## [Multiple Cursors](https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db)

> No plugins required

In vim selecting and editing is one step. This can be done with the `gn` text-object.
Normally you will search for a word you want to change and the change the next found occurrence with `cgn` once
and then use vim’s most powerful command the `. (dot)`.
Using `.` you can apply the change to the next word or skip one word with n which will jump to the next word.

## [Ack.vim]

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack

**QuickStart** `:Ack`

**Customization** `<leader>A` will `Ack` the word under your cursor.

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

    Run ctags -R in project root to generate tags

## [Ctrlp.vim]

Ctrlp provides an intuitive and fast mechanism to load files from the file system
(with regex and fuzzy find), from open buffers, and from recently used files.

**QuickStart** `<CTRL>-p`: will run the find file mode.

**Shortcuts**

* `1<CTRL>-p`: will run `:CtrlPBuffer`, the open buffers mode.
* `2<CTRL>-p`: will run `:CtrlPMRU`, the MRU files mode.

### [ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky)

Very simple function navigator for ctrlp.vim.

**QuickStart** `<leader>-fu`: to navigate and jump to function definitions from the current file without ctags

## [Undotree]

If you undo changes and then make a new change, in most editors the changes you undid are gone forever, as their undo-history is a simple list.
Since version 7.0 vim uses an undo-tree instead. If you make a new change after undoing changes, a new branch is created in that tree.
Combined with persistent undo, this is nearly as flexible and safe as git ;-)

Undotree makes that feature more accessible by creating a visual representation of said undo-tree.

**QuickStart** `F5`

## [Gist]

Gist current file/selection

Requires setting GITHUB_TOKEN and GITHUB_USER Env's

**QuickStart** `:Gist`

## [Turbux]

**QuickStart** `<leader>r` run current file's specs

**Other Shortcuts**:

 * `<leader>R` run closest specs
 * `<leader>g` run all project's specs

# Intro to VIM

Here's some tips if you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides by Drew Neil at [VIM: Walking Without Crutches](http://walking-without-crutches.heroku.com/#1).
* Blog post by Yann Esposito: [Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)
* Blog post by Mislav Marohnić: [Vim: revisited](http://mislav.uniqpath.com/2011/12/vim-revisited/)
* Blog post by Michael Jakl: [Vim Introduction and Tutorial](http://blog.interlinked.org/tutorials/vim_tutorial.html)
* Blog post by Jon Beltran de Heredia: [Why, oh WHY, do those #?@! nutheads use vi?](http://www.viemu.com/a-why-vi-vim.html)

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

### Vim cheat sheet

[source cheatsheet](http://vimcheatsheet.com/)

![vim cheatsheet image][vim-cheatsheet]

### Keyboard cheat sheet

[source cheatsheet](http://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png)

![vim key mapping cheatsheet image][vim-key-mapping-img]

# CREDITS

Strongly inspired by [spf13-vim : Steve Francia's Vim Distribution](https://github.com/spf13/spf13-vim)

[2ret-vim]:https://github.com/benichu/2ret-vim
[MacVim]:http://code.google.com/p/macvim/
[spf13-vim]:https://github.com/spf13/spf13-vim

[Ack.vim]:https://github.com/mileszs/ack.vim
[Ctrlp.vim]:https://github.com/kien/ctrlp.vim.git
[Fugitive]:http://github.com/tpope/vim-fugitive
[Gist]:https://github.com/mattn/gist-vim
[Gundo]:https://github.com/sjl/gundo.vim
[Matchit]:"http://www.vim.org/scripts/script.php?script_id=39
[Neocomplete]:https://github.com/Shougo/neocomplete.vim
[Surround]:https://github.com/tpope/vim-surround
[Tabularize]:http://github.com/godlygeek/tabular
[Tagbar]:http://github.com/majutsushi/tagbar
[Undotree]:https://github.com/mbbill/undotree
[Vim-vinegar]:http://github.com/tpope/vim-vinegar
[Vundle]:http://github.com/gmarik/vundle
[Turbux]:http://joshuadavey.com/2012/01/10/faster-tdd-feedback-with-tmux-tslime-vim-and-turbux

[2ret-vim-img-1]:http://storage.thouret.com.s3.amazonaws.com/monosnap/1._tmux_2016-05-14_09-16-41.png
[2ret-vim-vimrc]:http://storage.thouret.com.s3.amazonaws.com/monosnap/1._tmux_2016-05-14_09-14-24.png
[vim-cheatsheet]:http://i.imgur.com/PQQrd.png
[vim-key-mapping-img]:http://i.imgur.com/hP67T.png
