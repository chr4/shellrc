case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
    if [ -n "$ZSH_VERSION" ]; then
      function precmd() {
        echo -ne "\033]0;$(hostname) | ${PWD/$HOME/~}\007"
      }

      function preexec() {
        echo -ne "\033]0;$(hostname) | ${PWD/$HOME/~} | $1\007"
      }
    fi

    if [ -n "$BASH" ]; then
      PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*} | ${PWD/$HOME/~}\007"'
    fi
  ;;
esac
