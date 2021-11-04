# Rust package manager - cargo
source "$HOME/.cargo/env"

# C++ Flags.
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Virtualenv wrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:cd:cd ~:cd ..:* --help:ls:ls -la:ll:ls -lhs"
