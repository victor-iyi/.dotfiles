# .dotfiles

## Steps to bootstrap to a new Mac

1. Install Apple's Command line tools, which are pre-requisites for Git and
Homebrew.

```sh
xcode-select --install
```

2. Clone into new hidden directory

```sh
# Change directory to the $HOME directory.
cd $HOME

# Use SSH (if set up)...
git clone git@github.com:victor-iyi/.dotfiles.git

# ...or use HTTPS and switch remotes later.
git clone https://github.com/victor-iyi/.dotfiles.git
```

3. Create symlinks in the Home directory to the real files in the repo.

```sh
# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.

# ZSH (~/.zsh\w*|.zprofile)
$ ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
$ ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
$ ln -s ~/.dotfiles/zsh/.zprofile ~/.zprofile

# Config (~/.config)
$ ln -s ~/.dotfiles/config ~/.config

# Home (~/.)
$ ln -s ~/.dotfiles/home/.aliases ~/.aliases
$ ln -s ~/.dotfiles/home/.gitconfig ~/.gitconfig
$ ln -s ~/.dotfiles/home/.vim ~/.vim
$ ln -s ~/.dotfiles/home/.ripgreprc ~/.ripgreprc
$ ln -s ~/.dotfiles/home/.p10k.zsh ~/.p10k.zsh
```

4. Install Homebrew, follwed by the software listed in the `Brewfile`.

To generate `Brewfile` run `brew bundle dump --describe` in the directory you
want to save `Brewfile`.

```sh
# These could also be in an install script.

# Install Homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
$ brew bundle --file ~/.dotfiles/Brewfile

# ...or  move to the directory first.
$ cd ~/.dotfiles && brew  bundle
```

## TODO LIST

- [ ] Learn how to use [`defaults`] to record and restore Sytem Preferences and other
macOS configurations.
- [ ] Organize these growing steps into multiple script files.
- [ ] Automate symlinking and run script files with a bootstraping tool like [Dotbot].
- [ ] Revisit the list in [`.zshrc`] to customize the shell.
- [ ] Make a checklist of steps to decommission your computer before wiping your
hard drive.
- [ ] Create a [bootable USB installer for macOS][usb-installer-macos].
- [ ] Integrate other cloud services into your Dotfiles process (Dropbox,
Google Drive, etc.).
- [ ] Find inspiration and examples in other Dotfiles repositories at
[dotfiles.github.io]
- [ ] And last, but hopefully not least, take the
[Dotfiles from Start to Finish-ish][eieioxyz-course] course.

[`defaults`]: https://macos-defaults.com/#🙋-what-s-a-defaults-command
[Dotbot]: https://github.com/anishathalye/dotbot
[`zshrc`]: ./zsh/.zshrc
[usb-installer-macos]: https://support.apple.com/en-us/HT201372
[dotfiles.github.io]: https://dotfiles.github.io
[eieioxyz-course]: https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/?referralCode=445BE0B541C48FE85276

## Contribution

You are very welcome to modify and use them in your own projects.

Please keep a link to the [original repository](https://github.com/victor-iyi/.dotfiles).
If you have made a fork with substantial modifications that you feel may be useful,
then please [open a new issue on GitHub] with a link and short description.

[original repository]: https://github.com/victor-iyi/.dotfiles
[open a new issue on GitHub]: https://github.com/victor-iyi/.dotfiles/issues/

## License (Apache)

This project is opened under the [Apache License 2.0](./LICENSE) which allows very
broad use for both private and commercial purposes.

A few of the images used for demonstration purposes may be under copyright.
These images are included under the "fair usage" laws.

## Credits

- [Fireship.io]
- [eieio.xyz]

[Fireship.io]: https://fireship.io
[eieio.xyz]: https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/?referralCode=445BE0B541C48FE85276
