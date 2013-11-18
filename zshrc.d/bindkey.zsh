# start in vi mode
bindkey -v

# setup keys bindings for every mode
for mode in vicmd viins emacs; do
  # use up/down arrows to search history
  bindkey -M $mode '^[[A' history-beginning-search-backward
  bindkey -M $mode '^[[B' history-beginning-search-forward

  # use page-up/down to search history
  bindkey -M $mode '^[[I' history-beginning-search-backward
  bindkey -M $mode '^[[G' history-beginning-search-forward

  # bind ctrl-r for reverse search
  bindkey -M $mode '^R' history-incremental-search-backward

  # bind ctrl-a and ctrl-e
  bindkey -M $mode '^A' beginning-of-line
  bindkey -M $mode '^E' end-of-line

  # open line in vim by pressing 'v' or ctrl-x ctrl-e in command-mode
  autoload -U edit-command-line
  zle -N edit-command-line
  bindkey -M $mode '^V' edit-command-line
  bindkey -M $mode '^X^E' edit-command-line
done

# yank
bindkey -M vicmd 'YY' vi-yank-whole-line
bindkey -M vicmd 'Y'  vi-yank-whole-line

# bind undo and redo keys
bindkey -M vicmd 'U' undo
bindkey -M vicmd '^R' redo

# when in command mode, also allow history search with j and k
bindkey -M vicmd 'K' history-beginning-search-backward
bindkey -M vicmd 'J' history-beginning-search-forward
