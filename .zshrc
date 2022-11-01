# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/curl/bin:/usr/local/opt/m4/bin:/usr/local/opt/tcl-tk/bin:/usr/local/sbin:/usr/local/bin:$PATH"

# Homebrew
# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $HOME/.powerlevel10k/powerlevel10k.zsh-theme


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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
