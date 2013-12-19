# enable rvm if installed
type rvm_is_a_shell_function &> /dev/null
if [ -e ~/.rvm/scripts/rvm -a "$?" -eq 0 ]; then
  PATH=$PATH:~/.rvm/bin
  source ~/.rvm/scripts/rvm
fi
