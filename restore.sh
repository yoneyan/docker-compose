#!/bin/bash

cd backup

docker run  --volumes-from elasticsearch -v $(pwd):/backup alpine sh -c "cd / && tar zxvf /backup/kibana_data.tar.gz"


echo "Finish !!"
