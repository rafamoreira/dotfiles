
################################################################################
#                            COMPLETION                                        #
################################################################################
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select # interactive completion
setopt COMPLETE_ALIASES # auto complete command line aliases
setopt complete_in_word # not just at the end

################################################################################
#                            PROMPT                                            #
################################################################################
autoload -Uz promptinit
promptinit
# prompt walters # Set the theme
PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%~%f %# '
RPROMPT='%?'

################################################################################
#                            KEY BINDINGS                                      #
################################################################################
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -e # emacs mode

bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi

bindkey ' ' magic-space                               # [Space] - do history expansion

bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word

################################################################################
#                            HISTORY SETTINGS                                  #
################################################################################
HISTSIZE=50000                 # How many lines of history to keep in memory
SAVEHIST=10000                 # Number of history entries to save to disk
HISTFILE="$HOME/.zsh_history"  # Where to save history to disk

setopt extended_history
# Save each command’s beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file.

# setopt hist_expire_dups_first
# # delete duplicates first when HISTFILE size exceeds HISTSIZE

setopt hist_ignore_all_dups
# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous
# event).

setopt hist_ignore_space
# ignore commands that start with space

setopt hist_verify
# show command with history expansion to user before running it

setopt inc_append_history
# add commands to HISTFILE in order of execution

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

################################################################################
#                            HISTORY SEARCH                                    #
################################################################################
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

################################################################################
#                            MISC SETTINGS                                     #
################################################################################
setopt nohup # Don't send SIGHUP to background processes when the shell exits.

################################################################################
#                            COMMON ALIASES                                    #
################################################################################
alias ls="command ls --color=auto -h" # ls colors
alias l="ls -lah"
alias startx="xinit ~/.xinitrc $2"
alias rds_dump="pg_dump -h antonov.mobbiz.com.br -U gigaservices -F c -v"
alias easy_restore="pg_restore -h 127.0.0.1 -U postgres -x -c -v -O -d "

################################################################################
#                            PATH                                              #
################################################################################
export PATH=$HOME/.local/bin:$PATH

case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    esac

################################################################################
#                            PLUGINS                                           #
################################################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

eval $(keychain --eval id_rsa id_rsa_calisto)

### Added by Zplugin's installer
source '/home/rmc/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

# Load the pure theme, with zsh-async library that's bundled with it.
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

PURE_PROMPT_SYMBOL='$'
