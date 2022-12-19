#!/usr/bin/env zsh

# Shell completion path.
# Make sure to add it to $fpath in .zshrc
# echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
COMPLETION_PATH="${ZDOTDIR:-~}/.zsh_functions"

# Create completion path.
if [[ -d $COMPLETION_PATH ]]; then
  mkdir -p $COMPLETION_PATH
fi

# Alacritty completion.
if [[ ! -f $COMPLETION_PATH/_alacritty ]]; then
  # See https://github.com/alacritty/alacritty/blob/master/INSTALL.md
  # for more information...
  echo 'See https://github.com/alacritty/alacritty/blob/master/INSTALL.md'
  # cp extra/completions/_alacritty $COMPLETION_PATH
fi

# TODO(victor): Use `exists` function defined in `~/.functions`.
# Rust completion.
if [ ! command -v rustup > /dev/null 2>&1 ]; then
  echo 'Installing Rust...'
  # Install rustup.
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Update Rust.
echo 'Updating rustup...'
rustup update

# Shell completions for rustup.
if [[ ! -f ~/.zsh_functions/_rustup ]]; then
  echo 'Adding completion for rustup...'
  rustup completions zsh > ~/.zsh_functions/_rustup
fi

# Shell completions for cargo.
if [[ ! -f ~/.zsh_functions/_cargo ]]; then
  echo 'Adding completion for cargo...'
  rustup completions zsh cargo > ~/.zsh_functions/_cargo
fi
