#!/bin/bash

# Vimcent installation


install_vimrcs() {
  # Create symlinks
  ln -sv "$(pwd)/main.vim" ~/.vimrc
  ln -sv "$(pwd)/basic.vim" ~/.vim
  ln -sv "$(pwd)/filetypes.vim" ~/.vim
  ln -sv "$(pwd)/plugins.vim" ~/.vim
}

install_plugins() {
  # Make plugins folder
  mkdir -p ~/.vim/pack/vendor/start
  cd ~/.vim/pack/vendor/start || return
 
  # Separate cut and delete
  git clone --depth=1 https://github.com/svermeulen/vim-cutlass
  # Autosave and session/workspace saving
  git clone --depth=1 https://github.com/thaerkh/vim-workspace
  # Comentary
  git clone --depth=1 https://github.com/tpope/vim-commentary
  # Sorrounding
  git clone --depth=1 https://github.com/tpope/vim-surround 
}

clean() {
  # Remove vim folder
  rm -rf ~/.vim
  # Remove current vimrc
  rm -f ~/.vimrc
  # Create directories
  mkdir -vp ~/.vim/{swap,undo,colors}
}

install() {
  install_vimrcs
  install_plugins
}

prompt() {
  read -p "This will delete ~/.vim folder and ~/.vimrc file. Proceed?" -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]] 
  then
    clean
    install
    exit 1
  else
    echo "Aborted by user."
  fi
}

update_plugins() {
  cd ~/.vim/pack/vendor/start || return 
  find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree="$PWD"/{} pull origin master \;
}

prompt
