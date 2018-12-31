# # # # # # # #
#  COMPLETION #
# # # # # # # #
autoload -Uz compinit 
compinit
zstyle ':completion:*' menu select # interactive completion
setopt COMPLETE_ALIASES # auto complete command line aliases

# # # # # #
# PROMPT  #
# # # # # #
autoload -Uz promptinit
promptinit
# prompt walters # Set the theme 
bindkey -e # emacs mode

PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%~%f %# '
RPROMPT='%?'

alias ls="command ls --color=auto -h" # ls colors
alias la="ls -lah" 

# # # # # # # # # # # # #
# History Configuration #
# # # # # # # # # # # # # 

HISTSIZE=10000              # How many lines of history to keep in memory
HISTFILESIZE=10000          # Number of commands to save in the file
SAVEHIST=10000              # Number of history entries to save to disk
HISTFILE=~/.zsh_history     # Where to save history to disk
setopt append_history        # Append history to the history file (no overwriting)

setopt share_history
# This option both imports new commands from the history file, and also causes 
# your typed commands to be appended to the history file (the latter is like 
# specifying INC_APPEND_HISTORY, which should be turned off if this option is 
# in effect). The history lines are also output with timestamps ala 
# EXTENDED_HISTORY (which makes it easier to find the spot where we left off 
# reading the file after it gets re-written).

# By default, history movement commands visit the imported lines as well as 
# the local lines, but you can toggle this on and off with the set-local-history 
# zle binding. It is also possible to create a zle widget that will make some 
# commands ignore imported commands, and some include them.

# If you find that you want more control over when commands get imported, 
# you may wish to turn SHARE_HISTORY off, INC_APPEND_HISTORY or 
# INC_APPEND_HISTORY_TIME (see above) on, and then manually import commands 
# whenever you need them using ‘fc -RI’.

setopt extended_history 
# Save each command’s beginning timestamp (in seconds since the epoch) and the 
# duration (in seconds) to the history file.

setopt HIST_IGNORE_ALL_DUPS
# If a new command line being added to the history list duplicates an older one, 
# the older command is removed from the list (even if it is not the previous 
# event).

setopt HIST_IGNORE_SPACE

# not just at the end
setopt completeinword

# Don't send SIGHUP to background processes when the shell exits.
setopt nohup

# # # # # # # # # #
# HISTORY SEARCH  #
# # # # # # # # # #
autoload -U up-line-or-beginning-search 
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search


 

# # # # #
# PATH  #
# # # # #
export PATH=$HOME/.local/bin:$PATH

