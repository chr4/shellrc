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

# finally, make sure the terminal is in application mode, when zle is
# active. only then are the values from $terminfo valid.
function zle-line-init () {
  echoti smkx
}
function zle-line-finish () {
  echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish
