## LDAP Password Self Service Dockerfile

This repository contains the  **Dockerfile** of the [LDAP Self Service Password](http://ltb-project.org/wiki/documentation/self-service-password). This is based off of the apache php Dockerfile.

### Usage

docker run -d -p 80:80 issc29/ldap-reset-password

#### Customizing LDAP Passwrod Self Service

docker run -d -p 80:80 -v `<override-dir>`:/ldap-override issc29/ldap-reset-password

where `<override-dir>` is an absolute path of a directory that could contain:

  - `config.inc.php`: custom config file for ldap self service password that is located in conf/ directory

After few seconds, open `http://<host>` to see the LDAP Password Self Service Password page.
