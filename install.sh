#!/bin/sh

# Create Symlink to where config should live.
# ln path/to/file_or_dir/ path/to/symlink

# ZSH
ln -s ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zprofile ~/.zprofile

# Config
ln -s ~/dotfiles/config ~/.config
