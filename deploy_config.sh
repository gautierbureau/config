#!/bin/bash

git clone https://github.com/gautierbureau/config.git ~/Config
if [ -f "~/.bashrc" ];
  mv ~/.bashrc ~/.bashrc.old
fi
ln -s Config/bashrc ~/.bashrc
if [ -f "~/.zshrc" ];
  mv ~/.zshrc ~/.zshrc.old
fi
ln -s Config/zshrc-oh-my-zsh.zsh ~/.zshrc
if [ -f "~/.gitconfig" ];
  mv ~/.gitconfig ~/.gitconfig.old
fi
ln -s Config/gitconfig ~/.gitconfig
