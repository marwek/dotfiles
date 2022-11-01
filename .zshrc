# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/curl/bin:/usr/local/opt/m4/bin:/usr/local/opt/tcl-tk/bin:/usr/local/sbin:/usr/local/bin:$PATH"

export BREW_SHARE=/opt/homebrew/share
# zsh init
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH

    autoload -Uz compinit
    compinit
fi

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#C678DD,bg=black,bold,underline"
source $BREW_SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U promptinit; promptinit
# eval "$(oh-my-posh --init --shell zsh --config $HOME/.dotfiles/ohmyposh-config.json)"
source $HOME/.dotfiles/spaceshiprc
source "/opt/homebrew/opt/spaceship/spaceship.zsh"

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

# Homebrew
# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# pyenv
source $HOME/.dotfiles/pyenv

# node version manager
source $HOME/.dotfiles/nvmrc

# dotfiles imports
source $HOME/.dotfiles/aliases
source $HOME/.dotfiles/golang
source $HOME/.dotfiles/androidstudio

# devtools
source $HOME/.dotfiles/devtools

source $BREW_SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
