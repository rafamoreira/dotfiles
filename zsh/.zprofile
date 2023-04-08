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


    # MacPorts Installer addition on 2023-04-08_at_00:56:26: adding an appropriate PATH variable for use with MacPorts.
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.


    # MacPorts Installer addition on 2023-04-08_at_00:56:26: adding an appropriate MANPATH variable for use with MacPorts.
    export MANPATH="/opt/local/share/man:$MANPATH"
    # Finished adapting your MANPATH environment variable for use with MacPorts.

  ;;
  Linux)
    # commands for Linux go here
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac


