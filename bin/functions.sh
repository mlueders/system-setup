#!/bin/bash

addkey() {
    if [ $1 ]; then
        HOST=${1}.hoovers.com
    else
        echo "No host given"
        exit 1
    fi

    FOUND=`nslookup $HOST | grep -c "can't find"`
    if [ "$FOUND" == "1" ]; then
        echo "No such host '$HOST'"
        exit 1
    fi

    COMMAND='mkdir -p .ssh; cat >> .ssh/authorized_keys; chmod 700 .ssh; chmod 600 .ssh/authorized_keys'

    if [ "$2" == "set" ]; then
        COMMAND=${COMMAND/>>/>}
    fi

    `cat ~/.ssh/id_rsa.pub | ssh mlueders@${HOST} $COMMAND`
}

ant-debug() {
    export ANT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=4142"
    ant $*
}