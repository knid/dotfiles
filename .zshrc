# Exports
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR='vim'
export TERM=xterm-256color
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Users/sinankanidagli/development/flutter/bin:/usr/local/opt/mongodb-community@4.4/bin

plugins=(
  git
  docker
  aliases
  alias-finder
  celery
  urltools
  z
)

# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

eval 
  fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=zsh;
    export TF_ALIAS=fuck;
    TF_SHELL_ALIASES=$(alias);
    export TF_SHELL_ALIASES;
    TF_HISTORY="$(fc -ln -10)";
    export TF_HISTORY;
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
      thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
  }

# bindkeys
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

# opts
setopt BRACE_CCL
setopt AUTO_CD
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
# setopt CORRECT
# setopt CORRECT_ALL

# Aliases
alias HideDesktopIcons='defaults write com.apple.finder CreateDesktop -bool false; killall Finder'
alias ShowDesktopIcons='defaults write com.apple.finder CreateDesktop -bool true; killall Finder'
alias vim="nvim"
alias grepo='open https:$(git remote get-url --push origin | cut -d":" -f 2)'
alias ls="ls -p -G"
alias ll="ls -la -G"
alias g="git"
alias peco="peco --layout bottom-up --rcfile ~/.config/peco/config.json"
