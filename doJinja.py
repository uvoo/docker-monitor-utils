from jinja2 import Template
import os
import sys
import jinja2
targs = {}
targs['ZABBIX_AGENT_SERVERACTIVE'] = os.getenv('ZABBIX_AGENT_SERVERACTIVE')
targs['ZABBIX_AGENT_SERVER'] = os.getenv('ZABBIX_AGENT_SERVERACTIVE')
with open('kubeconfig.jinja') as f_:
    template = Template(f_.read())
txt = template.render(targs)
with open('.kube/config', 'w') as f_:
    f_.write(txt)
