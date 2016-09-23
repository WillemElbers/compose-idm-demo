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
_SERVERNAME="localhost"

LDAP_HOST="unity-idm"
LDAP_PORT=10000
LDAP_USER_DN="uid=admin,ou=system"
LDAP_BASE_DN="ou=system"

AUTH_LDAP_BIND_DN=${LDAP_USER_DN}
AUTH_LDAP_BIND_PASSWORD="admin123"
AUTH_LDAP_REQUIRE="ldap-group cn=developer,ou=groups,dc=localdomain"
AUTH_LDAP_URL="ldap://${LDAP_HOST}:${LDAP_PORT}/ou=system?mail?sub?(objectClass=person)"

POSTGRES_PASSWORD="testtesttest123!"
PGPASSWORD=${POSTGRES_PASSWORD}

SMTP_HOST="smtp.localdomain"
SMTP_PASSWORD="testtesttest123!"
SMTP_PORT="587"
SMTP_USER="trac@smtp.localdomain"

BACKUP_ROOT="/Users/wilelb"

