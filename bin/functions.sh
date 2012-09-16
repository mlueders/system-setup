#!/bin/bash

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

jbh() {
    cd /data/jboss
}

starttc() {
    export JAVA_OPTS="-Djboss.server.home.dir=file:///data/jboss/server/balboa -Djboss.server.config.url=file:///data/jboss/server/balboa/conf/"
    echo "export CLASSPATH=/data/jboss/server/balboa/conf" > /opt/tomcat6/bin/setenv.sh
    /opt/tomcat6/bin/catalina.sh start
}

stoptc() {
    pkill -9 -f org.apache.catalina.startup.Bootstrap
}

