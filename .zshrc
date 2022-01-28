# zsh init
autoload -U compinit
compinit -u

# spaceship init
autoload -U promptinit; promptinit
# prompt spaceship
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_DIR_TRUNC=0
eval "$(oh-my-posh --init --shell zsh --config ~/dotfiles/ohmyposh-config.json)"


bindkey '^I' complete-word

TZ="Europe/Warsaw"

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

HOSTNAME="`hostname`"
PAGER='less'

# starship init
#eval "$(starship init zsh)"
export PATH="/usr/local/opt/m4/bin:/usr/local/opt/tcl-tk/bin:/usr/local/sbin:/usr/local/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# dotfiles imports
source $HOME/dotfiles/path
source $HOME/dotfiles/aliases
source $HOME/dotfiles/golang
source $HOME/dotfiles/androidstudio

export PATH="$PATH:/usr/local/opt/openjdk@8/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

