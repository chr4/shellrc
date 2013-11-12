# colors
black=$'\e[00;30m'
red=$'\e[00;31m'
green=$'\e[00;32m'
yellow=$'\e[00;33m'
blue=$'\e[00;34m'
magenta=$'\e[00;35m'
cyan=$'\e[00;36m'
white=$'\e[00;37m'
none=$'\e[00;00m'

function parse_git_branch_full_ref {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

function parse_git_state {
  local git_state=""

  local git_dir="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $git_dir ] && test -r $git_dir/MERGE_HEAD; then
    git_state=${git_state}${red}⚡︎
  fi

  local num_untracked=$(git ls-files --other --exclude-standard 2> /dev/null |wc -l |tr -d ' ')
  if [ "$num_untracked" -gt 0 ]; then
    git_state=${git_state}${red}…
  fi

  local num_staged=$(git diff --cached --name-only 2> /dev/null |wc -l |tr -d ' ')
  if [ "$num_staged" -gt 0 ]; then
    git_state=${git_state}${yellow}✗
  elif ! git diff --quiet 2> /dev/null; then
    git_state=${git_state}${red}✗
  fi

  # clean
  if [ -z $git_state ]; then
    git_state=${green}✔
  fi

  echo -en ${git_state}${none}
}

# If inside a git repository, print its branch and state
function git_prompt_string {
  local git_where=$(parse_git_branch_full_ref)

  if [ -n "$git_where" ]; then
    echo -en "(${green}${git_where#refs/heads/}${none}|$(parse_git_state)) "
  fi
}

# set colorful prompt (PS1 doesn't support the color variables set above)
if [[ ${EUID} == 0 ]] ; then
  PS1='\[\033[00;37m\]\h \[\033[00;34m\]\W \[\033[00;00m\]$(git_prompt_string)\[\033[00;31m\]\$\[\033[00;00m\] '
else
  PS1='\[\033[00;37m\]\h \[\033[00;34m\]\W \[\033[00;00m\]$(git_prompt_string)\$ '
fi
