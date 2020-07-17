FROM python:3.8.4
MAINTAINER Refany Anhar

ARG STATE_ENV
ENV STATE=$STATE_ENV
ENV FLASK_APP=main.py
ENV FLASK_ENV=$STATE_ENV

#create user
ARG user=simple_flask
ARG group=simple_flask
ARG uid=1000
ARG gid=1000

RUN groupadd -g ${gid} ${group} \
    && useradd -d "/home/${user}" -u ${uid} -g ${gid} -m -s /bin/bash ${user}
RUN usermod -a -G root ${user}

USER ${user}

RUN mkdir /home/${user}/src
ADD requirement.txt /home/${user}/src
ADD main.py /home/${user}/src
COPY static/ /home/${user}/src/static
COPY templates/	/home/${user}/src/templates
ADD start.sh /home/${user}/src

USER root

RUN pip install -r /home/simple_flask/src/requirement.txt

USER ${user}

CMD sh /home/simple_flask/src/start.sh
