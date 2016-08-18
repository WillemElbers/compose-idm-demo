#!/bin/sh

# The container name of the MariaDB host (e.g., container). The default is normally okay.
MARIADB_HOST='mariadb'
# The database name to use for Drupal. The default is normally okay.
MYSQL_DATABASE='drupal'
# The password for the `$MYSQL_USER` user in MariaDB.
MYSQL_PASSWORD='123Test-changethis'
# The password for the `root` user in MariaDB.
MYSQL_ROOT_PASSWORD='Tes_tchangethis!123'
# The database user to use for Drupal. The default is normally okay.
MYSQL_USER='drupal'
# The value of the Apache httpd `ServerName` directive.
_SERVERNAME="www.clarin.eu"