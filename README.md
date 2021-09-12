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

```
curl.exe -kL "https://monitor.dev.example.com:443/monitor-utils/get/autoregistration/zabbix_agent2.conf?proxyToken=foo&hostname=foo&dns=foo"
```

# Zabbix Agent2 Install 

## Windows

Get Installer powershell script and run.
```
$proxyToken=PROXYTOKEN
(invoke-webrequest -uri "https://monitor.dev.example.com/monitor-utils/get/autoregistration/installZabbixAgent?proxyToken=$proxyToken").Content > install.ps1; powershell -file install.ps1
```

Force removal with installer if Zabbix zgent service already exists.
```
powershell -file install.ps1 -uninstall 1
```

## Linux

```
proxyToken=PROXYTOKEN
curl "https://monitor.dev.example.com/monitor-utils/get/autoregistration/installZabbixAgent?proxyToken=$proxyToken&os=linux&shell=bash" > install.sh; bash install.sh
```
