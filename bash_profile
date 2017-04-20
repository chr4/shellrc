if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# load all files from .shell/login.d directory
if [ -d $HOME/.shellrc/login.d ]; then
  for file in $HOME/.shellrc/login.d/*.sh; do
    source $file
  done
fi
