zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "~/.zshrc"
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
export GOROOT=/usr/local/go
export GO111MODULE=on
export HELM_EXPERIMENTAL_OCI=1
#export DOCKER_HOST=localhost:2375
export EDITOR=vim
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/kubebuilder/bin
if [[ -z "$TMUX" ]]; then
	ID=$(tmux ls | grep -vm1 attached | cut -d: -f1)
	if [[ -z "$ID" ]]; then
		exec tmux new-session
	else
		exec tmux attach-session -t "$ID"
	fi
fi

alias kazuma="echo 'はい, かずま です'"
alias display="~/Scripts/displays.sh"
alias loicme="~/Scripts/loicme.sh"
alias lock="~/Scripts/lock.sh"
alias backup="~/Scripts/backup.sh"
alias vbox="/usr/bin/VBoxClient-all"
alias kc='kubectl'
alias ag='agrind'
alias hg='cat ~/.histfile | grep'
alias docker='sudo docker'
alias yaml2js="python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'"

if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
	export EDITOR=nvim
fi
dcocker () { docker rm -f $(docker ps -q -a) && docker rmi -f $(docker images -q) && docker volume prune -f }
cd $HOME
if [ $commands[kubectl]  ]; then source <(kubectl completion zsh); fi
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
