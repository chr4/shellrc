# Shell dotfiles, conf.d stype, for multiple shells

I don't like messy dotfiles. You can [read here](https://chr4.org/blog/2014/09/10/conf-dot-d-like-directories-for-zsh-slash-bash-dotfiles) why.

## Features

* `~/.shellrc/rc.d` as an include.d style directory for scripts used by all shells
* `~/.shellrc/bashrc.d` as an include.d style directory for bashrc scripts
* `~/.shellrc/zsh.d` as an include.d style directory for zshrc scripts
* `~/.shellrc/login.d` as an include.d style directory for shared zlogin/bash\_profile scripts
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
ln -sf .shellrc/inputrc .inputrc

# zsh config
ln -sf .shellrc/zshrc .zshrc
ln -sf .shellrc/zlogin .zlogin
```
