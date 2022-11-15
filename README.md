# .dotfiles

My .dotfile configurations to backup, restore and sync my preferences and settings
for my development environment and toolbox.

If you would like to learn more about dotfiles, there's plenty of resources on
[dotfiles.github.io].

## Steps to bootstrap to a new Mac

1. Install Apple's Command line tools, which are pre-requisites for Git and
Homebrew.

```sh
xcode-select --install
```

<!-- markdownlint-disable ol-prefix -->
2. Clone into new hidden directory

```sh
# Change directory to the $HOME directory.
$ cd $HOME

# Use SSH (if set up)...
$ git clone git@github.com:victor-iyi/.dotfiles.git

# ...or use HTTPS
$ git clone https://github.com/victor-iyi/.dotfiles.git

# ... or github-cli
$ gh repo clone victor-iyi/.dotfiles
```

<!-- markdownlint-disable ol-prefix -->
3. Run automated installation *(thanks to [dotbot])* to add symlink, create
directories, and many more.

<!-- markdownlint-disable commands-show-output -->
```sh
$ ./install
```

<!-- markdownlint-disable ol-prefix -->
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

## Addons

Other setup &/or installations.

- TMUX Plugin Manager.

```sh
# TMUX Plugin Manager.
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## TODO LIST

- [ ] Learn how to use [`defaults`] to record and restore Sytem Preferences and other
macOS configurations.
- [ ] Organize these growing steps into multiple script files.
- [ ] Automate symlinking and run script files with a bootstraping tool like [dotbot].
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

## Contribution

You are very welcome to modify and use them in your own projects.

Please keep a link to the [original repository]. If you have made a fork with
substantial modifications that you feel may be useful,
then please [open a new issue on GitHub] with a link and short description.

## License (Apache)

This project is opened under the [Apache License 2.0](./LICENSE) which allows very
broad use for both private and commercial purposes.

A few of the images used for demonstration purposes may be under copyright.
These images are included under the "fair usage" laws.

## Credits

- [Fireship.io]
- [eieio.xyz]

[dotfiles.github.io]: https://dotfiles.github.io
[`defaults`]: https://macos-defaults.com/#🙋-what-s-a-defaults-command
[dotbot]: https://github.com/anishathalye/dotbot
[`.zshrc`]: ./zsh/zshrc
[usb-installer-macos]: https://support.apple.com/en-us/HT201372
[eieioxyz-course]: https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/?referralCode=445BE0B541C48FE85276
[original repository]: https://github.com/victor-iyi/.dotfiles
[open a new issue on GitHub]: https://github.com/victor-iyi/.dotfiles/issues/
[Fireship.io]: https://fireship.io
[eieio.xyz]: https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/?referralCode=445BE0B541C48FE85276
