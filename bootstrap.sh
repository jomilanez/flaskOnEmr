#!/bin/bash

set -x -e

IS_MASTER=false
if grep isMaster /mnt/var/lib/info/instance.json | grep true;
then
  IS_MASTER=true
fi

if [ "$IS_MASTER" = true ]; then
    sudo pip install numpy
fi

sudo pip install flask
sudo pip install cherrypy paste

