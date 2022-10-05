# Rust package manager - cargo
source "$HOME/.cargo/env"

# C++ Flags.
CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
CPPFLAGS+="-I/opt/homebrew/opt/libpq/include"
export CPPFLAGS

# Linker Flags.
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"

# Rust flags.
export RUSTFLAGS="/opt/homebrew/opt/libpq/include"

# OS can't find libclang.dylib
export DYLD_FALLBACK_LIBRARY_PATH="$(xcode-select --print-path)/usr/lib/"
# OR use XCode:
export DYLD_FALLBACK_LIBRARY_PATH="$(xcode-select --print-path)/Toolchains/XcodeDefault.xctoolchain/usr/lib/"

# LibTorch: PyTorch
# export LIBTORCH="/opt/homebrew/Cellar/libtorch/1.12.1"

# LD library.
# export LD_LIBRARY_PATH=$LIBTORCH:$LD_LIBRARY_PATH

# Virtualenv wrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

# Google Cloud Credentials
GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/legacy_credentials/vafolabi@lotlinx.com/dev-lotlinx-ml-8d85701510af.json"
export GOOGLE_APPLICATION_CREDENTIALS
# export CLOUDSDK_PYTHON=python3
 
# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:cd:cd ~:cd ..:* --help:ls:ls -la:ll:ls -lhs"
