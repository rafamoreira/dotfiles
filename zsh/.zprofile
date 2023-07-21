# ~/.zprofile
# I never know the real order and what goes where on the zshrc config files,
# so I'm starting to try to document this mess.
# Here things that are not related to the shell itself, but to the environment,
# like PATH, MANPATH, etc.
# This file is sourced by zsh at startup, before zshrc.
# Note for eval on brew shellenv: this is basically just a bunch of exports
# The ASDF directive is much more messy, so I'm not going to bother with it 
# for now.
# But I'm heavilly considering moving from asdf, not because of the mess here,
# but the latency on the terminal is becoming noticeable.

case `uname` in
  Darwin)
    # commands for OS X go here
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # . /opt/homebrew/opt/asdf/libexec/asdf.sh
    # Added by Toolbox App
    export PATH="$PATH:/Users/rmc/Library/Application Support/JetBrains/Toolbox/scripts"%

    # MacPorts Installer addition on 2023-04-08_at_00:56:26: adding an appropriate PATH variable for use with MacPorts.
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.

    # MacPorts Installer addition on 2023-04-08_at_00:56:26: adding an appropriate MANPATH variable for use with MacPorts.
    export MANPATH="/opt/local/share/man:$MANPATH"
    # Finished adapting your MANPATH environment variable for use with MacPorts.
    
    export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"

    export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"

    # Added by OrbStack: command-line tools and integration
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :

    source /opt/homebrew/opt/forgit/share/forgit/forgit.plugin.zsh
  ;;
  Linux)
    # commands for Linux go here
    export PATH="/home/rmc/.local/share/JetBrains/Toolbox/scripts:$PATH"
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
