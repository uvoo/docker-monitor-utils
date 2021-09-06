```
./buildpush.sh
```

```
docker run --name monitor-utils -it --rm -p 18080:80 -e ZABBIX_URL=$ZABBIX_URL uvoo/monitor-utils
```

```
curl localhost:18080/downloads/zabbix_agent2.conf
```

```
docker exec -it monitor-utils cat downloads/zabbix_agent2.conf
```

```
docker run --name monitor-utils -it --rm -p 18080:80 -e ZABBIX_URL=$ZABBIX_URL -e ZABBIX_AGENT_SERVERACTIVE="127.0.0.1" -e ZABBIX_AGENT_SERVER="127.0.0.1" uvoo/monitor-utils
```

```
curl localhost:18080/downloads/zabbix_agent2.conf?os=linux
curl localhost:18080/downloads/zabbix_agent2.conf?os=windows
```
