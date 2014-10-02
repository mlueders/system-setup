#!/bin/bash

tree() {
    find $1 -print | sed -e 's;[^/]*/;|--;g;s;--|; |;g'
}

tgz() {
    local DIR

    if [ $1 ]; then
        DIR="${1%/}"
    else
        echo "usage: tgz <dir name to archive>"
        return
    fi

    echo "tar -zcf '$DIR.tgz' '$DIR/'"
    `tar -zcf "$DIR.tgz" "$DIR/"`
}

addkey() {
    if [ $1 ]; then
        HOST=${1}.hoovers.com
    else
        echo "No host given"
        return
    fi

    FOUND=`nslookup $HOST | grep -c "can't find"`
    if [ "$FOUND" == "1" ]; then
        echo "No such host '$HOST'"
        return
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

ghswitch() {
    local WHO=$1
    cp ~/.ssh/id_rsa.gh_${1} ~/.ssh/id_rsa.gh
    cp ~/.ssh/id_rsa.gh_${1}.pub ~/.ssh/id_rsa.gh.pub
    ssh-add -D
    ssh-add ~/.ssh/id_rsa.gh

    local EMAIL=`awk '{ print($NF) }' ~/.ssh/id_rsa.gh.pub`
    git config --global user.email $EMAIL
}
