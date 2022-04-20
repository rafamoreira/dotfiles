export GPG_TTY=$(tty)
if [ -f ~/.config/using-alacritty ]; then
  export TERMINAL=alacritty
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
