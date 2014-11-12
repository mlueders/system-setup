#!/bin/bash

export DOCKER_HOST=tcp://192.168.55.55:2375
export JAVA_HOME=/opt/JVMVersions/CurrentJDK/Home
export GROOVY_HOME=/opt/groovy
export GRADLE_HOME=/opt/gradle
export GRAILS_HOME=/opt/grails
export SCALA_HOME=/opt/scala
export S3CMD_HOME=/opt/s3cmd
export M2_HOME=/opt/maven
export MAVEN_OPTS="-Xmx2048m -XX:PermSize=128m"

export PS1="\w$ "
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

export PATH=/usr/local/bin:$PATH:~/bin:$JAVA_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRADLE_HOME/bin:$SCALA_HOME/bin:$M2_HOME/bin:$S3CMD_HOME

alias rmbak="rm *~ .*~"
alias jbkill="pkill -9 -f jboss"
alias stop-ssh="sudo /etc/init.d/ssh stop"
alias start-ssh="sudo /etc/init.d/ssh start"
alias gr="gradle --daemon"
alias gw="./gradlew --daemon"
alias ll='ls -lah'

source ~/bin/functions.sh
source ~/bin/git-completion.bash

# ruby initialization
# export RBENV_ROOT=/usr/local/var/rbenv
# eval "$(rbenv init -)"
