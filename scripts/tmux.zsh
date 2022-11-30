#!/usr/bin/env zsh

echo '\n<<< Setting up TMUX Plugin Manager >>>\n'

# Ensure tmux is installed.
if !exists tmux; then
  # NOTE: This should be unreachable because tmux would be installed already.
  echo 'TMUX not installed.'

  # But just in case; install tmux with Homebrew.
  brew install tmux
fi

# Check if TPM already exists.
if [ -d ~/.tmux/plugins/tpm ]; then
  echo 'TMUX Plugin Manager already installed.'
else
  # Clone tpm from GitHub.
  echo 'Installing TMUX Plugin Manager...'
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
