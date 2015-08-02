Dotfiles
========

Personal dotfiles for \*NIX systems.
This dotfiles are from @wookayin, @lucidus21

## Installation

### Clone and Install!

```bash
git clone --recursive https://github.com/HunjaeJung/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
python install.py
```

The installation script will create symbolic links for the specified dotfiles.

### install.py script

This is a rough installation script written in python;
the task definition lies on the top of the script file.

### how to delete all .dotfiles

```bash
ls -al | grep .dotfiles | awk9 | xargs rm -r
```

### additional resources

- you may need to install zsh from your own package manger.(apt-get install zsh)
- powerline font install: https://github.com/powerline/fonts
