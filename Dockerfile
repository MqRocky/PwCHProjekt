FROM php:7.0-apache AS ProjektApp

LABEL author="Krzysztof Ogonek"
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    iproute2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
COPY skrypt.sh project/skrypt.sh
RUN ["project/skrypt.sh"]
EXPOSE 80
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
