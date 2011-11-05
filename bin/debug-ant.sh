#!/bin/bash

export ANT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=4142"
ant $*
