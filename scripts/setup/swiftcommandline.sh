#!/bin/bash

if [ ! -d swiftcommandline ]
then
    git clone git@github.com:mhahn/swiftcommandline.git &&
        cd swiftcommandline &&
        make install
fi
