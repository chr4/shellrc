# ~/.zshrc

# load all files from .shell/zshrc.d directory
if [ -d ~/.shell/zshrc.d ]; then
  for file in ~/.shell/zshrc.d/*; do
    source $file
  done
fi

# load all files from .shell/rc.d directory
if [ -d ~/.shell/rc.d ]; then
  for file in ~/.shell/rc.d/*; do
    source $file
  done
fi
