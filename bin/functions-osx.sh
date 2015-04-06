#!/bin/bash

swjava() {
    local INDEX=$1
    local VERSIONS=`/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home | uniq`
    local JVM

    if [ -z "${INDEX}" ]; then
        _select_from_options JVM "JVM" ${VERSIONS[@]}
    else
        local VERSIONS_ARRAY=(${VERSIONS[@]})
        INDEX=$((INDEX - 1))
        JVM=${VERSIONS_ARRAY[$INDEX]}
    fi

    export JAVA_HOME=$(/usr/libexec/java_home -v $JVM)
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
}
