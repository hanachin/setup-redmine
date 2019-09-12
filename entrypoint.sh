#!/bin/bash

set -e

if [ $1 = trunk ]; then
  svn co --non-interactive --config-option servers:global:ssl-authority-files=<(curl -sL https://www.gandi.net/static/CAs/GandiStandardSSLCA2.pem) https://svn.redmine.org/redmine/trunk redmine-trunk
  cd redmine-trunk
  exit
fi
if [ ! -d redmine-$1 ]; then
  curl https://redmine.org/releases/redmine-$1.tar.gz | tar zx
fi

cd redmine-$1
