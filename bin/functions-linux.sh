#!/bin/bash

function realpath() {
    echo `readlink -f $1`
}

function swjava() {
    local INDEX=$1
    local JVM

    if [ -z "${INDEX}" ]; then
        sudo update-alternatives --config java
    else
        sudo update-alternatives --config java <<EOF
${INDEX}
EOF
    fi

    set_java_home
    java -version
}

function set_java_home() {
    local ALT_JAVA_LS=`ls -l /etc/alternatives/java`
    export JAVA_HOME=`echo "${ALT_JAVA_LS}" | sed 's/.* -> \(.*\)\/jre\/bin\/java$/\1/'`
}

