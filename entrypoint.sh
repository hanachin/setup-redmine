#!/bin/bash

set -e

if [ $1 = trunk ]; then
  svn co --non-interactive --config-option servers:global:ssl-authority-files=<(curl -sL https://www.gandi.net/static/CAs/GandiStandardSSLCA2.pem) https://svn.redmine.org/redmine/trunk redmine-trunk
else
  curl https://redmine.org/releases/redmine-$1.tar.gz | tar zx
fi

if [ -n $2 ]; then
  mv redmine-$1 $2
  echo ::set-output name=path::$2
else
  echo ::set-output name=path::$(pwd)/redmine-$1
fi
