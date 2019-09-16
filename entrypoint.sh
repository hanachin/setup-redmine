#!/bin/bash

set -e

if [ $1 = trunk ]; then
  svn co --non-interactive --config-option servers:global:ssl-authority-files=<(curl -sL https://www.gandi.net/static/CAs/GandiStandardSSLCA2.pem) https://svn.redmine.org/redmine/trunk redmine-trunk
else
  curl https://redmine.org/releases/redmine-$1.tar.gz | tar zx
fi

mv redmine-$1 /tmp

if [ -z $2 ]; then
  rsync -r /tmp/redmine-$1 /github/workspace
else
  mv /tmp/redmine-$1 $2
fi
