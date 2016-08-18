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
         http * trac          * >---------+
              *****************           |
                                          |
              *****************           |
          ??? * svn           * >---------+ 
              *****************           |
                                          |
              *****************           |
              *               * >---------+
         http * website       * >---+     |
              *****************     |     |
                                    |     |
              *****************     |     |
              * mariadb       * <---+     |
              *****************           |
                                          |
       webdav *****************           |
         http * Owncloud      * >---------+
      desktop *****************           |      
                                         ldap (10000 / 10443)     
              *****************           |
              *               * <---------+ 
 https (2443) * Unity-IDM     *  
              *               * <---------+
              *****************           |
                                         saml
              *****************           |     
        https * Shibboleth SP * >---------+
              *****************                      
```

# Run the demo

## Initialisation

If you are starting from scratch (no volumes), a one time initialisation step is needed to generate the certificate and 
ssl parameters for the website:

```
sh -ace '. "./prod.sh" ; docker-compose -f initialise.yml -p idm-demo up'
```

## Running the services

This is a list of commands used to manage the demo environment:

```
# Create and start all services
sh -ace '. "./prod.sh" ; docker-compose -p idm-demo up'

# Stop and remove all services
docker-compose -p idm-demo down           
```

## Remove everything

If you want to reset to a clean state and remove all docker volumes, run:

```
# Stop and remove all services, including volumes!
docker-compose -p idm-demo down -v        
```

_WARNING_: this will remove all data, including any customization you have made.

# Finalizing the setup

## 1. Update hosts file

Add the following to your hosts file (`/etc/hosts`):

```
127.0.0.1 unity-idm
127.0.0.1 shibboleth-sp
127.0.0.1 owncloud
```	

## 2. Configure unity registration form

<todo>

## 3. Register test user

<todo>

## 4	. Test

Access:

```
https://shibboleth-sp/debugger
```

Login to owncloud:
```
https://owncloud:81
```

# SAML Metadata Exchange process

Entrypoint of the unity-idm container is a shell script which:

1. Waits for the SP metadata endpoint to become available
2. Downloads SP metadata
3. Starts supervisord in the foreground, which in turn starts unity-idm

Entrypoint in the shibboleth-sp container is the command to run supervisord in the foreground which:

1. Starts apache, tomcat, shibd and the download-metadata.sh script
2. The download-metadata.sh waits for the IDP metadata endpoint to become available
3. Downloads the IDP metadata
4. Restarts unity-idm

This setup ensures that the IDP (unity-idm) always downloads the SP metadata first before starting and as soon as the IDP is running, the SP will download the IDP metadata and restart. This completes the metadata exchange and establishes the trust relationship between IDP and SP.

# Debugging

```
ssh -f test@127.0.0.1 -L 5000:127.0.0.1:4000 -N -p 9000
```