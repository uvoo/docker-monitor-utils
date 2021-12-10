#!/bin/bash
set -eux

tmpdir=$(mktemp -d -t tmp-XXX)
major=5
minor=4
patch=8
release=$major.$minor.$patch
archive_file=${tmpdir}/zabbix_agent2-${release}-windows-amd64-openssl-static.zip
curl -L https://cdn.zabbix.com/zabbix/binaries/stable/${major}.${minor}/${release}/zabbix_agent2-${release}-windows-amd64-openssl-static.zip -o $archive_file 
unzip -oj $archive_file  *zabbix_agent2.exe -d downloads  || true
sha256sum downloads/zabbix_agent2.exe | awk '{print $1}' > downloads/zabbix_agent2.exe.sha256
rm -rf $tmpdir
