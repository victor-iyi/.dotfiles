#!/bin/sh

# Create Symlink to where config should live.
# ln path/to/file_or_dir/ path/to/symlink

# Config
ln -s ~/dotfiles/config ~/.config

# ZSH (~/.zsh\w*|.zprofile)
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.zprofile ~/.zprofile

# Config (~/.config)
ln -s ~/.dotfiles/config ~/.config

# Home (~/.)
ln -s ~/.dotfiles/home/.aliases ~/.aliases
ln -s ~/.dotfiles/home/.functions ~/.functions
ln -s ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/home/.vim ~/.vim
ln -s ~/.dotfiles/home/.ripgreprc ~/.ripgreprc
ln -s ~/.dotfiles/home/.p10k.zsh ~/.p10k.zsh
ln -s ~/.dotfiles/home/.tmux.conf ~/.tmux.conf
