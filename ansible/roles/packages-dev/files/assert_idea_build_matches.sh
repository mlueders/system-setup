#!/bin/bash

IDEA_TGZ=$1
EXPECTED_BUILD=$2

ACTUAL_BUILD=`tar -tf "${IDEA_TGZ}" | head -n1 | sed 's/^idea-IU-\([^/]*\).*/\1/'`

if [ "${EXPECTED_BUILD}" != "${ACTUAL_BUILD}" ]; then
    echo "Expected build number '${EXPECTED_BUILD}' does not match actual build number '${ACTUAL_BUILD}'"
    exit 1
fi

