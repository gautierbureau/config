#!/bin/bash

if [ -d "$HOME/Config" ]; then
  rm -rf $HOME/Config
fi
git clone https://github.com/gautierbureau/config.git $HOME/Config
if [ -f "$HOME/.bashrc" ]; then
  mv $HOME/.bashrc $HOME/.bashrc.old
fi
ln -s Config/bashrc $HOME/.bashrc
if [ -f "$HOME/.zshrc" ]; then
  mv $HOME/.zshrc $HOME/.zshrc.old
fi
ln -s Config/zshrc-oh-my-zsh.zsh $HOME/.zshrc
if [ -f "$HOME/.gitconfig" ]; then
  mv $HOME/.gitconfig $HOME/.gitconfig.old
fi
ln -s Config/gitconfig $HOME/.gitconfig
if [ -f "$HOME/.vimrc" ]; then
  mv $HOME/.vimrc $HOME/.vimrc.old
fi
ln -s Config/vimrc $HOME/.vimrc
