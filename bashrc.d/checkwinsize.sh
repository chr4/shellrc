# bash won't get SIGWINCH if another process is in the foreground.
# enable checkwinsize so that bash will check the terminal size when
# it regains control. #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
