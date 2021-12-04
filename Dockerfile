# syntax=docker/dockerfile:1
FROM python:slim-buster

WORKDIR /app

# SHELL ["/bin/bash", "-c"]
COPY requirements.txt requirements.txt
RUN python3 -m venv venv
RUN . venv/bin/activate
RUN pip3 install -r requirements.txt

# COPY . .
COPY app.py .
COPY downloads/ . 
COPY wsgi.py .
COPY main .
COPY README.md .
COPY  zabbix_agent2.conf.jinja .
COPY  zabbix_agentd.conf.jinja .

# CMD [ "python3", "app.py"]
# CMD [ "gunicorn", "--workers", "4", "--access-logfile", "-", "--bind", "0.0.0.0:80" "wsgi:app"]
RUN chmod +x main
# ENTRYPOINT [ "bash", "-eux", "main" ]
ENTRYPOINT [ ./main ]
