# Enable history appending instead of overwriting.
shopt -s histappend

# the maximum number of lines contained in the history file
HISTFILESIZE=100000

# the  number of commands to remember in the command history
HISTSIZE=100000

# ignore lines starting with a whitespace, as well as duplicates
HISTCONTROL=ignoreboth

# use shared history file with zsh
HISTFILE=~/.history
