![fluentd-dockerimage](https://github.com/yoneyan/docker-logserver/workflows/fluentd-dockerimage/badge.svg "fluentd-dockerimage")
# docker-compose
docker_composeで作ったもの

## 注意
Grafanaの永続用データ(./grafana)が保存されるが、権限を777に設定する必要あり

## Status
### LogServer
|service|status|
|---|---|
|zabbix|worked|
|grafana|worked|
|kibana|worked|
