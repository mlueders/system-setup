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
    local ID=$1

    if [ "${ID}" == "" ]; then
        echo "ERROR: rsa id required"
        return
    fi

    if [ ! -f ~/.ssh/id_rsa.gh_${ID} ]; then
        echo "ERROR: ~/.ssh/id_rsa.gh_${ID} does not exist"
        return
    fi

    cp ~/.ssh/id_rsa.gh_${ID} ~/.ssh/id_rsa.gh
    cp ~/.ssh/id_rsa.gh_${ID}.pub ~/.ssh/id_rsa.gh.pub
    ssh-add -D
    ssh-add ~/.ssh/id_rsa.gh

    local EMAIL=`awk '{ print($NF) }' ~/.ssh/id_rsa.gh.pub`
    git config --global user.email $EMAIL
}

killtomcat() {
    local PID=`ps aux |grep "o[r]g.apache.catalina.startup.Bootstrap" | awk '{print $2}'`
    kill -9 $PID
}

awscheckip() {
    curl checkip.amazonaws.com
}

swjava() {
    local VERSIONS=`/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home | uniq`
    local JVM

    select_from_options JVM "JVM" ${VERSIONS[@]}

    export JAVA_HOME=$(/usr/libexec/java_home -v $JVM)
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
}

function select_from_options() {
    local VARNAME=$1
    local PROMPT=$2
    shift; shift
    local OPTIONS=($@)

    if [ "${OPTIONS}" = "" ]; then
        echo "ERROR: No options provided"
        exit 1
    fi

    PS3="${PROMPT}: "
    echo "Select ${PROMPT}"

    local INPUT
    until [ "${INPUT}" != "" ]; do
        select INPUT in ${OPTIONS[@]}; do
            break
        done
    done
    eval "$VARNAME=$INPUT"
}

function dbash() {
    local CONTAINER_ID=$1

    if [ -z "${CONTAINER_ID}" ]; then
        echo "ERROR: Container id required"
        return 1
    fi

    docker exec -it "${CONTAINER_ID}" /bin/bash
}