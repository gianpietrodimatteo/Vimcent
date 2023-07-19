<p align="center" display="inline-block">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project_%28454045%29.jpg/380px-Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project_%28454045%29.jpg" height="200">
    <img src="https://upload.wikimedia.org/wikipedia/commons/9/9f/Vimlogo.svg" height="200">
</p>

# Vimcent

Vimcent is a lean VIM configuration that aims to use it as a text and code editor. It does not intend on substituting file systems, command lines or IDEs. It is a compilation of the features I personally use in VIM, minus the ones I don't. 

## Features

* Uses system clipboard. Separates cut (m M) and delete (d D)
* No backup. Persistant undo. Deletes swap files on save.
* Autosave and session saving
* Easy comment code (gcc) and surround (S) 
* Special configuration for text files, such as text wrapping and using normal regular TAB 
* Many other basic "must have" configurations for using VIM in modern days

Furthermore,

* Prettier and more informative status line, including the current folder git branch
* Gruvbox colorscheme

## Installation

Install gvim or just vim.
If you're using Linux or macOS, backup .vim, .vimrc and run install.sh.
Needless to remind you that you can just copy whatever you want from basic.vim, text.vim or plugins.vim and paste it on your .vimrc.

## Included plugins

* [vim-cutlass](https://github.com/svermeulen/vim-cutlass): Separate cut and delete
* [vim-workspace](https://github.com/thaerkh/vim-workspace): Autosave and session saving
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment code
* [vim-surround](https://github.com/tpope/vim-surround): Surround text
* [gruvbox](https://github.com/morhetz/gruvbox): Gruvbox colorscheme
* [lightline](https://github.com/itchyny/lightline.vim): Format status line
* [vim-gitbranch](https://github.com/itchyny/vim-gitbranch): Adds git branch information to status line
