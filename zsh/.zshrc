################################################################################
#                            COMPLETION                                        #
################################################################################
case `uname` in
	Darwin)
		if type brew &>/dev/null; then
    			FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH
  		fi
	;;
esac
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select # interactive completion
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES # auto complete command line aliases
setopt complete_in_word # not just at the end

################################################################################
#                            PROMPT                                            #
################################################################################

case `uname` in
  Darwin)
    # commands for OS X go here
    source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"
	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  ;;
  Linux)
    # commands for Linux go here
    source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

#machine specific stuff
case $HOST in
	"jupiter" ) source "${ZDOTDIR:-${HOME}}/.zshrc-${HOST}"
	;;
    "mercury.local" )
		source "${ZDOTDIR:-${HOME}}/.zshrc-mercury"
    ;;
	*)
		source "${ZDOTDIR:-${HOME}}/.zshrc-general"
esac

alias githash="git rev-parse HEAD"
autoload -Uz promptinit
promptinit
PROMPT='%F{green}%n%f@%F{magenta}%M%f %F{blue}%B%~%b%f %# '
RPROMPT='$(git_super_status)'

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
HISTSIZE=500000                 # How many lines of history to keep in memory
SAVEHIST=500000                 # Number of history entries to save to disk
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
#                            PATH                                              #
################################################################################
export PATH=$HOME/.local/bin:/home/rmc/.cargo/bin:$PATH

# I don't know why this is here, but it's here.
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    esac

################################################################################
#                            PLUGINS                                           #
################################################################################

# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh


if [ -f ~/.config/using-rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.local/opt/wakatime-zsh-plugin/wakatime.plugin.zsh"

if [ -f ~/.config/using-chruby ]; then
  source /usr/local/share/chruby/chruby.sh
fi

# eval "$(pyenv init -)"

# eval "$(pyenv virtualenv-init -)"

# export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

################################################################################
#                            ALIASES                                           #
################################################################################
alias ls="command ls --color=auto -h" # ls colors
alias l="ls -lah"
# alias startx="xinit $HOME/.xinitrc $2"
# alias ssh="TERM=xterm-256color ssh" # this shit fixes alacritty non standard TERMINFO

# intempus aliases
# alias py3_make_migration="docker exec -it dev-django python3 ./manage.py makemigrations"
# alias py2_make_migration="docker exec -it dev-django python ./manage.py makemigrations"

alias git_clean_merged_branches='git branch --merged | grep -E -v "(^\*|master|dev)" | xargs git branch -d'

# ledger aliases
alias itau_txt_convert="reckon --csv-separator=';' --date-format '%d/%m/%Y' --date-column 1 --money-column 3 -c 'R$' --account 'Assets:Bank:Itau' -o ~/finances/main.dat -t tokens.yaml --comma-separates-cents -l ~/finances/main.dat -f itau.txt"
alias bradesco_ofx_convert="ledger-autosync -l ~/finances/main.dat --fid 000 --account Assets:Bank:Bradesco bradesco.ofx >> bradesco.dat"
alias vim=nvim
alias timestamped_commit="git commit -am \"$(date)\" && git push"
alias edit_vim="cd ~/.config/nvim && nvim ."


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#asdf
[ -f /opt/asdf-vm/asdf.sh ] && . /opt/asdf-vm/asdf.sh

export EDITOR='vim'
