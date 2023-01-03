#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

# TODO(victor): Use `exists` function defined in `~/.functions`.
# Homebrew installation
if ! command -v brew > /dev/null 2>&1; then
  # Install homebrew.
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  # Homebrew already installed.
  echo "Skipping homebrew installation..."
fi

# Update & upgrade homebrew.
brew update && brew upgrade

# NOTE: Keep and eye out for a different `--no-quarantine` solution.
#
# Currently, you can't do `brew bundle --no-quarantine` as an option.
# It's currently exported in zshenv:
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474

# NOTE: Brewfile location.
#
# As an option to find the `Brewfile` file, you can pass --file=path/to/Brewfile
# or put it in a global location `~/.Brewfile` and run `brew bundle --global`

# Install and upgrade (by default) all dependencies from `Brewfile`.
brew bundle --describe
