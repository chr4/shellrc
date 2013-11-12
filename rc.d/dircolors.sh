# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.

if [ -n "$BASH" ]; then
  checkcmd="type -P"
elif [ -n "$ZSH_NAME" ]; then
  checkcmd="whence"
else
  checkcmd="false"
fi

match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
  && $checkcmd dircolors >/dev/null \
  && match_lhs=$(dircolors --print-database)

# Enable colors for ls, etc.  Prefer ~/.dir_colors
if $checkcmd dircolors >/dev/null ; then
  if [[ -f ~/.dir_colors ]]; then
    eval $(dircolors -b ~/.dir_colors)
  elif [[ -f /etc/DIR_COLORS ]]; then
    eval $(dircolors -b /etc/DIR_COLORS)
  fi
fi

# color aliases
for cmd in ls grep fgrep egrep; do
  if $cmd --color=auto &> /dev/null; then
    alias $cmd="$cmd --color=auto"
  fi
done

export CLICOLOR=1

# try to keep environment pollution down, EPA loves us.
unset match_lhs
