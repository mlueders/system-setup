#!/bin/bash

export M3_HOME=/usr/local/Cellar/maven/3.3.9/bin/mvn
export MAVEN_OPTS="-Xmx2048m -XX:PermSize=128m"
export LUMINATE_HOME="`realpath ~/IdeaProjects/Blackbaud`"
export LUMINATE_ONLINE_HOME="${LUMINATE_HOME}/luminate-online"

source ~/bin/functions-blackbaud.sh

alias bb='cd ~/IdeaProjects/Blackbaud'
alias lo='cd ~/IdeaProjects/Blackbaud/luminate-online'
alias loi='cd ~/IdeaProjects/Blackbaud/luminate-online-infrastructure'
#alias droute='sudo route add -net 192.168.0.0/16 -interface vboxnet0'
alias evaldocker='eval $(docker-machine env blackbaud2)'
