function zle-line-init zle-keymap-select() {
  zle reset-prompt
}

zle -N zle-keymap-select

# start in vim insert mode
bindkey -v

# yank
bindkey -M vicmd 'yy' vi-yank-whole-line
bindkey -M vicmd 'Y'  vi-yank-whole-line

# bind undo and redo keys
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo

# use k and j instead of arrow keys in command mode
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# bind ctrl-r for reverse search
bindkey '^r' history-incremental-search-backward

# bind ctrl-a and ctrl-e
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

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
