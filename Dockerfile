FROM ubuntu:14.04

RUN apt-get update && apt-get install -y python-pip
WORKDIR /opt/webapp
ADD app.py .

WORKDIR /tmp
ADD requirements.txt .
RUN pip install -qr requirements.txt

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip


EXPOSE 5000

CMD ["python", "/opt/webapp/app.py"]
