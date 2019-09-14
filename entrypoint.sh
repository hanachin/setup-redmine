#!/bin/bash

set -e

if [ $1 = trunk ]; then
  svn co --non-interactive --config-option servers:global:ssl-authority-files=<(curl -sL https://www.gandi.net/static/CAs/GandiStandardSSLCA2.pem) https://svn.redmine.org/redmine/trunk redmine-trunk
  mv redmine-trunk $2
  exit
fi

curl https://redmine.org/releases/redmine-$1.tar.gz | tar zx
mv redmine-$1 $2
