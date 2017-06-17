#!/bin/bash

if [ `uname` != 'Linux' ] && [ `uname` != 'Darwin' ]; then
    echo "Unknown uname: `uname`, exiting..."
    sleep 5
    exit 1
fi


source ~/bin/git-completion.bash
source ~/bin/functions.sh

if [ `uname` = 'Linux' ]; then
    source ~/bin/functions-linux.sh
    set_java_home
else
    source ~/bin/functions-osx.sh
    source ~/bin/realpath.sh
    export JAVA_HOME=/opt/JVMVersions/CurrentJDK/Home
fi


export S3CMD_HOME=/opt/s3cmd
export GOLANG_HOME=/usr/local/go

export PS1="\w$ "
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

export PATH=/usr/local/bin:$PATH:~/bin:$S3CMD_HOME:$GOLANG_HOME/bin

# gopath is for intellij plugin
export GOPATH=$GOLANG_HOME

alias rmbak="rm -f *~ .*~"
alias stop-ssh="sudo /etc/init.d/ssh stop"
alias start-ssh="sudo /etc/init.d/ssh start"
alias gr="gradle --daemon"
alias gw="./gradlew --daemon"
alias gwo="./gradlew --daemon --offline"
alias ll='ls -lah'
alias gdf='git diff --color | diff-so-fancy'
alias gdc='git diff --cached --color | diff-so-fancy'
alias whatsmyip='dig +short myip.opendns.com @resolver1.opendns.com'

alias ifm='cd ~/IdeaProjects/IdeaFlow'

eval "$(hub alias -s)"

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"
