# http://zshwiki.org/home/zle/bindkeys
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup keys accordingly for every mode
for mode in vicmd viins emacs; do
  [[ -n "${key[Home]}"   ]] && bindkey -M $mode "${key[Home]}"   beginning-of-line
  [[ -n "${key[End]}"    ]] && bindkey -M $mode "${key[End]}"    end-of-line
  [[ -n "${key[Insert]}" ]] && bindkey -M $mode "${key[Insert]}" overwrite-mode
  [[ -n "${key[Delete]}" ]] && bindkey -M $mode "${key[Delete]}" delete-char
  [[ -n "${key[Up]}"     ]] && bindkey -M $mode "${key[Up]}"     up-line-or-history
  [[ -n "${key[Down]}"   ]] && bindkey -M $mode "${key[Down]}"   down-line-or-history
  [[ -n "${key[Left]}"   ]] && bindkey -M $mode "${key[Left]}"   backward-char
  [[ -n "${key[Right]}"  ]] && bindkey -M $mode "${key[Right]}"  forward-char
done

# ensures that $terminfo values are valid and updates editor information when
# the keymap changes.
function zle-keymap-select zle-line-init zle-line-finish {
  # the terminal must be in application mode when zle is active for $terminfo
  # values to be valid.
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi

  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
