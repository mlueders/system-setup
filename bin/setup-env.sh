#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-6-sun
export ANT_HOME=/opt/ant
export GROOVY_HOME=/opt/groovy
export GRADLE_HOME=/opt/gradle
export SCALA_HOME=/opt/scala

alias rmbak="rm *~"
alias jbkill="pkill -9 -f jboss"
alias clean-ivy="rm -rf ~/.ant"