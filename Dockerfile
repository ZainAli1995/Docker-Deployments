FROM centos

COPY workaroundscript.sh /opt/

RUN chmod u+x /opt/workaroundscript.sh && /opt/workaroundscript.sh

RUN yum -y update && yum -y install python3

RUN pip3.6 install flask

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0
