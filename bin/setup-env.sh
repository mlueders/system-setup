#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-6-sun
export ANT_HOME=/opt/ant
export GROOVY_HOME=/opt/groovy
export GRADLE_HOME=/opt/gradle
export GRAILS_HOME=/opt/grails
export SCALA_HOME=/opt/scala

export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRADLE_HOME/bin:$SCALA_HOME/bin

alias rmbak="rm *~ .*~"
alias jbkill="pkill -9 -f jboss"
alias clean-ivy="rm -rf ~/.ant"

source ./functions.sh
