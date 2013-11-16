# yank
bindkey -M vicmd 'YY' vi-yank-whole-line
bindkey -M vicmd 'Y'  vi-yank-whole-line

# bind undo and redo keys
bindkey -M vicmd 'U' undo
bindkey -M vicmd '^R' redo

# use page-up/down to search history (insert and command mode)
bindkey -M viins '^[[I' history-beginning-search-backward
bindkey -M viins '^[[G' history-beginning-search-forward
bindkey -M vicmd '^[[I' history-beginning-search-backward
bindkey -M vicmd '^[[G' history-beginning-search-forward

# use up/down arrows to search history (insert and command mode)
bindkey -M viins '^[[A' history-beginning-search-backward
bindkey -M viins '^[[B' history-beginning-search-forward
bindkey -M vicmd '^[[A' history-beginning-search-backward
bindkey -M vicmd '^[[B' history-beginning-search-forward

# when in command mode, also allow history search with j and k
bindkey -M vicmd 'K' history-beginning-search-backward
bindkey -M vicmd 'J' history-beginning-search-forward
