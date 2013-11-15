# ~/.bashrc
#
# this file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. so make sure this doesn't display
# anything or bad things will happen !

# test for an interactive shell. there is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # shell is non-interactive. be done now!
  return
fi

# load all files from .shell/bashrc.d directory
if [ -d ~/.shellrc/bashrc.d ]; then
  for file in ~/.shellrc/bashrc.d/*.bash; do
    source $file
  done
fi

# load all files from .shell/rc.d directory
if [ -d ~/.shellrc/rc.d ]; then
  for file in ~/.shellrc/rc.d/*; do
    source $file
  done
fi
