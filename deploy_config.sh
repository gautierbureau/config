#!/bin/bash

git clone https://github.com/gautierbureau/config.git ~/Config
ln -s Config/bashrc ~/.bashrc
ln -s Config/zshrc-oh-my-zsh.zsh ~/.zshrc
ln -s Config/gitconfig .gitconfig
