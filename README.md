# Dotfiles

This repository contains "dotfiles" with my preferred settings for tools such as
Vim and the Z shell. It also contains a Brewfile, which the Homebrew package
manager uses to install software in bulk.

## Use

Clone this repository and run `./install`. This will

- install Homebrew and the packages listed in the Brewfile;
- create symbolic links in the home directory that point to the dotfiles in this
  repository; and
- install Vim plugins.

Add machine-specific configuration to `~/.zshrc_local` and `./gitconfig_local`.
These files are included by their counterparts in this repository.
