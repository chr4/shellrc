# tell the terminal about the working directory at each prompt.
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]]; then

  function update_terminal_cwd() {
    # identify the directory using a "file:" scheme url,
    # including the host name to disambiguate local vs.
    # remote connections. percent-escape spaces.
    local URL_PATH=''
    {
      # use lang=c to process text byte-by-byte.
      local i ch hexch LANG=C
      for ((i = 1; i <= ${#PWD}; ++i)); do
        ch="$PWD[i]"
        if [[ "$ch" =~ [/._~A-Za-z0-9-] ]]; then
          URL_PATH+="$ch"
        else
          hexch=$(printf "%02X" "'$ch")
          URL_PATH+="%$hexch"
        fi
      done
    }

    local PWD_URL="file://$HOST$URL_PATH"

    printf '\e]1;%s\a' "$HOST $(basename $URL_PATH)" # tab title
    printf '\e]7;%s\a' "$PWD_URL" # window title (with icon)
  }

  # register the function so it is called whenever the working
  # directory changes.
  autoload add-zsh-hook
  add-zsh-hook chpwd update_terminal_cwd

  # tell the terminal about the initial directory.
  update_terminal_cwd
fi
