# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

################################################################################
#                              THEME                                           #
################################################################################

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="candy"
ZSH_THEME="spaceship"

if [ $ZSH_THEME = "spaceship" ]; then
  SPACESHIP_CHAR_SYMBOL="$ "
  SPACESHIP_CHAR_SYMBOL_ROOT="# "
  SPACESHIP_USER_SHOW=always
  SPACESHIP_HOST_SHOW=always
fi


################################################################################
#                              DEFAULT OH MY ZSH                               #
################################################################################

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/zsh.custom

################################################################################
#                              PLUGINS                                         #
################################################################################
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


plugins=(git)
#wakatime)

source $ZSH/oh-my-zsh.sh

# User configuration
################################################################################
#                              MISC                                            #
################################################################################
eval $(keychain --eval id_rsa)

# Awful way to determine if this is a VM and I should connect to host X11
if [ -f ~/this-is-a-vm ]; then
  export DISPLAY=10.0.0.1:0.0
fi

if [ -f ~/using-rvm ]; then
  # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
fi

if [ -f ~/using-rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

export VISUAL=vim
export EDITOR="$VISUAL"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.local/bin"

################################################################################
#                              ALIAS                                           #
################################################################################

alias startx="xinit ~/.xinitrc $2"
alias rds_dump="pg_dump -h antonov.mobbiz.com.br -U gigaservices -F c -v"
alias easy_restore="pg_restore -h 127.0.0.1 -U postgres -x -c -v -O -d "
alias abnt2="setxkbmap -model abnt2 -layout br -variant abnt2"
alias lock="xscreensaver-command -lock"

alias be="bundle exec"
alias zrdm="zeus rake db:migrate && zeus rake db:test:prepare"

