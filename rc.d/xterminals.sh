case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
    if [ -n "$ZSH_VERSION" ]; then
      # there's no HOSTNAME variable on zsh
      HOSTNAME=$(hostname)

      function precmd() {
        echo -ne "\033]0;${HOSTNAME%%.*} | $(basename $PWD)\007"
      }

      function preexec() {
        echo -ne "\033]0;${HOSTNAME%%.*} | $(basename $PWD) | $1\007"
      }
    fi

    if [ -n "$BASH" ]; then
      PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*} | $(basename $PWD)\007"'
    fi
  ;;
esac
