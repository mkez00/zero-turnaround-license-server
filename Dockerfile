FROM openjdk:8
MAINTAINER Michael Kezele <mike.kezele@gmail.com>

ENV SERVER_URL="http://dl.zeroturnaround.com/license-server/releases/license-server-3.3.6.zip"

RUN mkdir /zt
RUN wget -O /tmp/license-server.zip -q "${SERVER_URL}"
RUN unzip -u -o /tmp/license-server.zip -d /zt

EXPOSE 9000

VOLUME ["/zt/license-server/data/"]

CMD ["/zt/license-server/bin/license-server.sh", "run"]