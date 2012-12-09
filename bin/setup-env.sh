#!/bin/bash

export JAVA_HOME=/opt/JVMVersions/1.6/Home
export ANT_HOME=/opt/ant
export GANT_HOME=/opt/gant
export GROOVY_HOME=/opt/groovy
export GRADLE_HOME=/opt/gradle
export GRAILS_HOME=/opt/grails
export SCALA_HOME=/opt/scala

export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$GANT_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRADLE_HOME/bin:$SCALA_HOME/bin

alias rmbak="rm *~ .*~"
alias jbh="cd /data/jboss"
alias jbkill="pkill -9 -f jboss"
alias clean-ivy="rm -rf ~/.ant"
alias stop-ssh="sudo /etc/init.d/ssh stop"
alias start-ssh="sudo /etc/init.d/ssh start"

source ~/bin/functions.sh
