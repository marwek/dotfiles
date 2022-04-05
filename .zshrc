export PATH="/opt/homebrew/bin:/opt/homebrew/opt/curl/bin:/usr/local/opt/m4/bin:/usr/local/opt/tcl-tk/bin:/usr/local/sbin:/usr/local/bin:$PATH"

# zsh init
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#C678DD,bg=black,bold,underline"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U promptinit; promptinit
eval "$(oh-my-posh --init --shell zsh --config ~/.dotfiles/ohmyposh-config.json)"

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

# devtools
source ~/.dotfiles/devtools

# pyenv
source ~/.dotfiles/pyenv

# dotfiles imports
source $HOME/.dotfiles/aliases
source $HOME/.dotfiles/golang
source $HOME/.dotfiles/androidstudio

# VS Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
