autoload -Uz colors && colors

# display exit code of last command, unless 0
function exit_code_prompt_info() {
  echo -n "%(?..%{$fg[red]%}[%?]%{$reset_color%})"
}
