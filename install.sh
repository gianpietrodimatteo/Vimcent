#!/bin/bash

# Vimcent installation script

install_vimrcs() {
  # Create symlinks
  ln -sv "$(pwd)/main.vim" ~/.vimrc
  ln -sv "$(pwd)/basic.vim" ~/.vim
  ln -sv "$(pwd)/text.vim" ~/.vim/ftplugin
  ln -sv "$(pwd)/plugins.vim" ~/.vim
  ln -sv "$(pwd)/keymaps.vim" ~/.vim
}

install_plugins() {
  # Make plugins folder
  mkdir -p ~/.vim/pack/all-vendors/start
  cd ~/.vim/pack/all-vendors/start || return

  # Separate cut and delete
  git clone --depth=1 https://github.com/svermeulen/vim-cutlass.git
  # Autosave and session/workspace saving
  git clone --depth=1 https://github.com/thaerkh/vim-workspace.git
  # Commenting code
  git clone --depth=1 https://github.com/tpope/vim-commentary.git
  # Sorrounding
  git clone --depth=1 https://github.com/tpope/vim-surround.git
  # Gruvbox colorscheme
  git clone --depth=1 https://github.com/morhetz/gruvbox.git
  # Status line formatting
  git clone --depth=1 https://github.com/itchyny/lightline.vim.git
  # Git branch information on status line
  git clone --depth=1 https://github.com/itchyny/vim-gitbranch.git
  # Fuzzy file finder
  git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git
  # Search folder contents (requires ack)
  git clone --depth=1 https://github.com/mileszs/ack.vim.git
  # Helps on creating lists
  git clone --depth=1 https://github.com/dkarter/bullets.vim.git
  # Helps on editing lists
  git clone --depth=1 https://github.com/KabbAmine/lazyList.vim.git
  # Helps moving around
  git clone --depth=1 https://github.com/easymotion/vim-easymotion.git
}

clean() {
  # Remove vim folder
  rm -rf ~/.vim
  # Remove current vimrc
  rm -f ~/.vimrc
  # Create directories
  mkdir -vp ~/.vim/{swap,undo,ftplugin,sessions}
}

install() {
  install_vimrcs
  install_plugins
}

prompt() {
  read -p "This will delete ~/.vim folder and ~/.vimrc file. Proceed? [y]" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    clean
    install
    echo "Make sure to install ack package on your system"
    exit 1
  else
    echo "Aborted by user."
  fi
}

update_plugins() {
  cd ~/.vim/pack/all-vendors/start || return
  find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree="$PWD"/{} pull origin master \;
}

prompt
