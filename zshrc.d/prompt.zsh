autoload -Uz colors && colors

# set colorful prompt (PS1 doesn't support the color variables set above)
if [[ ${EUID} == 0 ]]; then
  PROMPT='%m %{$fg[blue]%}%1~%{$reset_color%}$(__git_ps1 " (%s)") %{$fg[red]%}%#%{$reset_color%} '
else
  PROMPT='%m %{$fg[blue]%}%1~%{$reset_color%}$(__git_ps1 " (%s)") %# '
fi

RPROMPT='$(vi_mode_prompt_info) $(exit_code_prompt_info)'
