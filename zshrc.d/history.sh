HISTSIZE=100000             # remember to 100.000 entries
SAVEHIST=$HISTSIZE          # save history to file
HISTFILE=$HOME/.history     # share history file with bash

setopt hist_ignore_all_dups # ignore duplicate entries
setopt hist_ignore_space    # do not record lines beginning with a space
setopt inc_append_history   # append new commands instantly (rather than on shell exit)

# use readline-like history search with the arrow keys
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# ctrl-r to search through history
bindkey '^R' history-incremental-search-backward
