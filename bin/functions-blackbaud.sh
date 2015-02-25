#!/bin/bash

awsssh() {
    local USER=$1
    local HOST=$2

    if [ -z "${HOST}" ]; then
        HOST=$USER
        USER=root
    fi

    ssh -i ~/.ssh/id_rsa.0-default ${USER}@${HOST}
}

localwebstart() {
    sudo /opt/apache.org/httpd-current/bin/httpd -k start
    /opt/apache.org/tomcat6-current/bin/startup.sh
}

localwebstop() {
    sudo /opt/apache.org/httpd-current/bin/httpd -k stop
    killtomcat
}
