function precmd() {
  echo -ne "\033]0;$(hostname) | $(basename $PWD)\007"
}

function preexec() {
  echo -ne "\033]0;$(hostname) | $(basename $PWD) | $1\007"
}
