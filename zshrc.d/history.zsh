HISTSIZE=100000             # remember up to 100.000 entries
SAVEHIST=$HISTSIZE          # save history to file
HISTFILE=~/.history         # share history file with bash

setopt hist_ignore_all_dups # ignore duplicate entries
setopt hist_ignore_space    # do not record lines beginning with a space
setopt inc_append_history   # append new commands instantly (rather than on shell exit)
