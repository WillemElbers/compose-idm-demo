# Compose IDM demo

This project provides a docker compose file which will setup and run a number of docker containers such that a unity-idm service will be running connected to an owncloud instance via LDAP and a shibboleth service provider via SAML.

## Docker images

The following docker images are used to setup this environment:

* [docker-clarin-owncloud](https://github.com/WillemElbers/docker-clarin-owncloud)
* [docker-unity-idm (ldap branch)](https://github.com/clarin-eric/docker-unity-idm/tree/unity-ldap)
* shibboleth sp to be provided

# Commands

This is a list of commands used to manage the demo environment:

```
docker-compose -p idm-demo up           # Create and start all services
docker-compose -p idm-demo up           # Stop and remove all services
```