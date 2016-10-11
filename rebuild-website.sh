#!/bin/sh
sh -ace '. "./prod.sh" ; docker-compose -p idm-demo down' && \
docker rm idmdemo_httpd_preparer_1 && \
docker volume rm idmdemo_website_httpd_dynamic_cfg idmdemo_website_httpd_htdocs && \
sh -ace '. "./prod.sh" ; docker-compose -f initialise.yml -p idm-demo up httpd_preparer'
