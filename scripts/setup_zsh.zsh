#!/usr/bin/env zsh

echo "\n<<< Startin ZSH setup >>>\n"

# Check if installed zsh is in list of available sheels.
#
# https://stackoverflow.com/a/4749368/1341838
if grep -Fxq '/usr/local/bin/zsh' '/etc/shells'; then
  echo '/usr/local/bin/zsh already exists in /etc/shells'
else
  # echo 'Enter superuser (sudo) password to edit /etc/sheels'
  echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

# Change $SHELL to installed zsh.
if [ $SHELL = '/usr/local/bin/zsh' ]; then
  echo '$SHELL is already /usr/local/bin/zsh'
else
  echo 'Enter user password to change login shell'
  chsh -s '/usr/local/bin/zsh'
fi

# Link shell to installed version
if sh --version | grep -q zsh; then
  echo '/private/var/select/sh already linked to /bin/zsh'
else
   echo 'Enter superuser (sudo) password to symlink sh to zsh'
   sudo ln -sfv /bin/zsh /private/var/select/sh

   # TODO: Use this instead.
   # sudo ln -sfv /usr/local/bin/zsh /private/var/select/sh
fi
