function zle-line-init zle-keymap-select() {
  zle reset-prompt
}

zle -N zle-keymap-select

# start in vim insert mode
bindkey -v

# yank
bindkey -M vicmd 'YY' vi-yank-whole-line
bindkey -M vicmd 'Y'  vi-yank-whole-line

# bind undo and redo keys
bindkey -M vicmd 'U' undo
bindkey -M vicmd '^R' redo

# bind home and end key
bindkey -M viins '^[[H' beginning-of-line
bindkey -M viins '^[[F' end-of-line

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

# bind ctrl-r for reverse search
bindkey -M viins '^R' history-incremental-search-backward

# bind ctrl-a and ctrl-e
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg[red]%}<<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, unless it was defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
