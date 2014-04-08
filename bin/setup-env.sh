#!/bin/bash

export JAVA_HOME=/opt/JVMVersions/Current/Home
export GROOVY_HOME=/opt/groovy
export GRADLE_HOME=/opt/gradle
export GRAILS_HOME=/opt/grails
export SCALA_HOME=/opt/scala

export PATH=/usr/local/bin:$PATH:~/bin:$JAVA_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRADLE_HOME/bin:$SCALA_HOME/bin

alias rmbak="rm *~ .*~"
alias jbh="cd /data/jboss"
alias jbkill="pkill -9 -f jboss"
alias clean-ivy="rm -rf ~/.ant"
alias stop-ssh="sudo /etc/init.d/ssh stop"
alias start-ssh="sudo /etc/init.d/ssh start"
alias gr="gradle --daemon"
alias gw="./gradlew --daemon"

source ~/bin/functions.sh
source ~/bin/git-completion.bash

# ruby initialization
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
