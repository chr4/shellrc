# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS. try to use the external file
# first to take advantage of user additions. use internal bash
# globbing instead of external grep binary.

# enable colors for ls, etc. prefer ~/.dir_colors
if [ -x /usr/bin/dircolors ]; then
  if [[ -f ~/.dir_colors ]]; then
    eval $(dircolors -b ~/.dir_colors)
  elif [[ -f /etc/DIR_COLORS ]]; then
    eval $(dircolors -b /etc/DIR_COLORS)
  fi
fi

# enable --color switch for commands, if supported
for cmd in ls grep fgrep egrep; do
  if $cmd --color=auto &> /dev/null; then
    alias $cmd="$cmd --color=auto"
  fi
done

# macos ls doesn't support ls --color, but uses CLICOLOR environment variable
export CLICOLOR=1

# try to keep environment pollution down, EPA loves us.
unset match_lhs
