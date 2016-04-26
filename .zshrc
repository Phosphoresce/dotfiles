zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/radio/.zshrc'
autoload -Uz compinit
compinit

autoload -U colors && colors

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT="%{$fg[cyan]%} -> %{$reset_color%}"

setopt appendhistory
unsetopt beep notify

export GOPATH=$HOME/Code/go
eval $(ssh-agent) > /dev/null
alias kazuma="echo 'hai kazuma, desu'"
alias :wq="echo 'You're a fucking retard."
alias display="~/Scripts/displays.sh"
alias lock="~/Scripts/lock.sh"
alias backup="~/Scripts/backup.sh"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh