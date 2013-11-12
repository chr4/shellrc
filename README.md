# My shell dotfiles.

## Features

* `~/.shell/rc.d` as an include.d style directory for scripts used by all shells
* `~/.shell/bashrc.d` as an include.d style directory for bashrc scripts
* `~/.shell/zsh.d` as an include.d style directory for zshrc scripts
* git repository information (current branch, current status) without external dependencies
* colorful prompt
* shared history for all shells

## Installation

```bash
cd
git clone git://github.com/chr4/shellrc.git .shellrc

# bash config
ln -sf .shellrc/bashrc .bashrc
ln -sf .shellrc/bash_profile .bash_profile

# zsh config
ln -sf .shellrc/zshrc .zshrc
```
