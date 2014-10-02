#!/bin/bash

export DOCKER_HOST=tcp://localhost:4243
export JAVA_HOME=/opt/JVMVersions/CurrentJDK/Home
export GROOVY_HOME=/opt/groovy
export GRADLE_HOME=/opt/gradle
export GRAILS_HOME=/opt/grails
export SCALA_HOME=/opt/scala
export M2_HOME=/opt/maven

export PATH=/usr/local/bin:$PATH:~/bin:$JAVA_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRADLE_HOME/bin:$SCALA_HOME/bin:$M2_HOME/bin

alias rmbak="rm *~ .*~"
alias jbkill="pkill -9 -f jboss"
alias stop-ssh="sudo /etc/init.d/ssh stop"
alias start-ssh="sudo /etc/init.d/ssh start"
alias gr="gradle --daemon"
alias gw="./gradlew --daemon"

source ~/bin/functions.sh
source ~/bin/functions-blackbaud.sh
source ~/bin/git-completion.bash

# ruby initialization
# export RBENV_ROOT=/usr/local/var/rbenv
# eval "$(rbenv init -)"
