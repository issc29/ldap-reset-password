#!/bin/bash

#
# start.bash
#

OVERRIDE="/ldap-override"
CONFIG_FILE="config.inc.php"
CONFIG_LOCATION="/var/www/html/conf"

# Symlink config file.
if [[ -f "$OVERRIDE/$CONFIG_FILE" ]]; then
  rm -f "$CONFIG_LOCATION/$CONFIG_FILE"
  cp "$OVERRIDE/$CONFIG_FILE" "$CONFIG_LOCATION/$CONFIG_FILE"
fi

 /usr/local/bin/apache2-foreground
