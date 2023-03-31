zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "~/.zshrc"
autoload -Uz compinit
compinit

autoload -U colors && colors
PROMPT="%{$fg[cyan]%} -> %{$reset_color%}"

# Attach to existing tmux session if applicable
if [[ -z "$TMUX" ]]; then
	ID=$(tmux ls | grep -vm1 attached | cut -d: -f1)
	if [[ -z "$ID" ]]; then
		exec tmux new-session
	else
		exec tmux attach-session -t "$ID"
	fi
fi

# History
HISTFILE=~/.histfile
HISTSIZE=1000000
HISTFILESIZE=-1
SAVEHIST=1000000

setopt appendhistory
unsetopt beep notify

# Environment
export WINHOME=/mnt/c/Users/$USER
export GOPATH=$HOME/Code/go
export GOROOT=/usr/local/go
export GO111MODULE=on
export HELM_EXPERIMENTAL_OCI=1
#export DOCKER_HOST=localhost:2375
export EDITOR=vim
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/kubebuilder/bin

# Aliases
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
alias ll="ls -alh"
alias llc="ls -alh | column"
alias ip="ip -c"
alias diff="diff --color"

# Functions
dcocker () { docker rm -f $(docker ps -q -a) && docker rmi -f $(docker images -q) && docker volume prune -f }
ssha () { eval $(ssh-agent) > /dev/null && ssh-add ~/.ssh/id_* 2> /dev/null }

# Use neovim if possible
if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
	export EDITOR=nvim
	# automatically create ~/.config/nvim -> ~/.vim link if not there?
fi

# Autocompletion and highlighting
if [ $commands[kubectl]  ]; then source <(kubectl completion zsh); fi
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Force starting at user home
cd $HOME
