#!/bin/bash

if [ -d "~/Config" ]; then
  rm -rf ~/Config
fi
git clone https://github.com/gautierbureau/config.git ~/Config
if [ -f "~/.bashrc" ]; then
  mv ~/.bashrc ~/.bashrc.old
fi
ln -s Config/bashrc ~/.bashrc
if [ -f "~/.zshrc" ]; then
  mv ~/.zshrc ~/.zshrc.old
fi
ln -s Config/zshrc-oh-my-zsh.zsh ~/.zshrc
if [ -f "~/.gitconfig" ]; then
  mv ~/.gitconfig ~/.gitconfig.old
fi
ln -s Config/gitconfig ~/.gitconfig
