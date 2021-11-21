FROM php:7.0-apache AS ProjektApp 
# Używam apache jako serwera 

LABEL author="Krzysztof Ogonek"
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
# To polecenie aktualizuje repozytorium obrazu, instaluje paczkę z której potrzebuję polecenia netstat które pobierze ip, a następnie czyszczę repozytorium aby zminimalizować 
# rozmiar obrazu

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    iproute2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
# Podobnie jak powyżej, tylko instaluję paczkę z której mogę używać polecenia ip.
# Prawdopodobnie mogłem czyścić repo dopiero tutaj a nie również powyżej, ale tak dla pewności robię to w obu przypadkach

COPY skrypt.sh project/skrypt.sh
# Kopiuję skrypt bashowy do katalogu kontenera (kod skryptu znajduje się w drugim pliku) 

RUN ["project/skrypt.sh"]
# Uruchamiam skrypt

EXPOSE 80
# Eksponuję kontener na porcie 80 (default port dla http)

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
# Konfiguruję serwer apache (znalezione na stronie i spisane na jana, nie mam pojęcia co to robi, przepraszam =D)
