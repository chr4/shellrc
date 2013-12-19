# set colorful prompt (PS1 doesn't support the color variables set above)
if [[ ${EUID} == 0 ]]; then
  PS1='\h \[\033[00;34m\]\W\[\033[00;00m\]$(__git_ps1 " (%s)") \[\033[00;31m\]\$\[\033[00;00m\] '
else
  PS1='\h \[\033[00;34m\]\W\[\033[00;00m\]$(__git_ps1 " (%s)") \$ '
fi
