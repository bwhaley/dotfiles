## Aliases
alias ll='ls -alF'
# Open the github page associated with current directory's repo
alias gh="open https://github.\$(git config remote.origin.url | cut -f2 -d. | tr ':' /)"
alias sudo='sudo '

alias v="ansible-vault --vault-password-file ~/.vaultpw "
alias d="decrypt"
alias e="encrypt"

## Environment

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export DOCKER_HOST=tcp://192.168.59.103:2375

# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Add git branch to shell prompt
export PS1="[\u@\h \W]\[\e[0;32m\] \$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')\[\e[m\]$ "
export PATH=/usr/local/bin:$PATH::/Library/PostgreSQL/9.3/bin:~/bin:$GOBIN

# bash completion for AWS CLI
test -f "/Users/bwhaley/.aws/aws.bashrc" && . "/Users/bwhaley/.aws/aws.bashrc"

# Resty  - curl for REST
source ~/bin/resty

# Site specific
