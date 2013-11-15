# setup keys bindings for every mode
for mode in vicmd viins emacs; do
  # use up/down arrows to search history
  bindkey -M $mode '^[[A' history-beginning-search-backward
  bindkey -M $mode '^[[B' history-beginning-search-forward
  bindkey -M $mode '^[[I' history-beginning-search-backward
  bindkey -M $mode '^[[G' history-beginning-search-forward

  # bind ctrl-r for reverse search
  bindkey -M $mode '^R' history-incremental-search-backward

  # bind ctrl-a and ctrl-e
  bindkey -M $mode '^A' beginning-of-line
  bindkey -M $mode '^E' end-of-line

  # open line in vim by pressing 'v' in command-mode
  autoload -U edit-command-line
  zle -N edit-command-line
  bindkey -M $mode '^V' edit-command-line
done
