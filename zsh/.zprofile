export GPG_TTY=$(tty)
if [ -f ~/.config/using-alacritty ]; then
  export TERMINAL=alacritty
fi

case `uname` in
  Darwin)
    # commands for OS X go here
	eval "$(/opt/homebrew/bin/brew shellenv)"
  ;;
  Linux)
    # commands for Linux go here
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
