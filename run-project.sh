#!/bin/sh
sh -ace '. "./prod.sh" ; docker-compose -p idm-demo up -d'
