#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <animation>"
    exit 1
fi

ANIMATION=$1

odin run test/headless.odin -file -- samples/spineboy/export/spineboy-pro.json samples/spineboy/export/spineboy.atlas $ANIMATION
