# Compose IDM demo

This project provides a docker compose file which will setup and run a number of docker containers such that a unity-idm service will be running connected to an owncloud instance via LDAP and a shibboleth service provider via SAML.

## Docker images

The following docker images are used to setup this environment:

* [docker-clarin-owncloud](https://github.com/WillemElbers/docker-clarin-owncloud): Owncloud service.
* [docker-unity-idm (ldap branch)](https://github.com/clarin-eric/docker-unity-idm/tree/unity-ldap): Unity Identity Managament with SAML Identity Provider and LDAP server.
* [docker-shibboleth-sp-demo](https://github.com/WillemElbers/docker-shibboleth-sp-demo): Shibboleth Service Provider with demo application to view headers and shibboleth attributes.

## Architecture

The docker containers are setup as follows:

```
              *****************
         http * Owncloud      * <---------+
              *****************           |      
                                         ldap (10000 / 10443)     
              *****************           |
              *               * <---------+ 
 https (2443) * Unity-IDM     *  
              *               * <---------+
              *****************           |
                                         saml
              *****************           |     
        https * Shibboleth SP * <---------+
              *****************                      
```

# Run the demo

This is a list of commands used to manage the demo environment:

```
docker-compose -p idm-demo up             # Create and start all services
docker-compose -p idm-demo down           # Stop and remove all services
```

If you want to reset to a clean state and remove all docker volumes, run:

```
docker-compose -p idm-demo down -v        # Stop and remove all services, including volumes!
```

_WARNING_: this will remove all data, including any customization you have made.

# Finalizing the setup

## 1. Exchange SAML metadata

The unity-idm SAML IDP and shibboleth Service Provider must exchange metadata. Run the following commands:

```
docker-compose -p idm-demo exec shibboleth-sp /opt/download-metadata.sh && 
docker-compose -p idm-demo exec unity-idm /opt/download-metadata.sh
```

These commands will download the metadata files and restart the IDP and SP service so that the new metadata is loaded.

## 2. Update unity admin password

The first thing that needs to be done if all services are running is the set a new password for your unity admin account.

* goto https://localhost:2443/admin/admin
* Login with your admin account
* You will be prompted to update your credential, so update it and relogin	