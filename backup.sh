#!/bin/bash

mkdir backup
cd backup

tar cfvz zabbix_data.tar.gz ../zabbix/zbx_env
docker run  --volumes-from elasticsearch -v $(pwd):/backup alpine tar czvf /backup/kibana_data.tar.gz /usr/share/elasticsearch/data


echo "Finish !!"
