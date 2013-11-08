# enable rvm if installed
if [ -e $HOME/.rvm/scripts/rvm ]; then
  PATH=$PATH:$HOME/.rvm/bin
  source $HOME/.rvm/scripts/rvm
fi
