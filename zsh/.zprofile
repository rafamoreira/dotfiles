export GPG_TTY=$(tty)
if [ -f ~/.config/using-alacritty ]; then
  export TERMINAL=alacritty
fi

case `uname` in
  Darwin)
    # commands for OS X go here
	eval "$(/opt/homebrew/bin/brew shellenv)"

	. /opt/homebrew/opt/asdf/libexec/asdf.sh
	# Added by Toolbox App
	export PATH="$PATH:/Users/rmc/Library/Application Support/JetBrains/Toolbox/scripts"%

  ;;
  Linux)
    # commands for Linux go here
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
