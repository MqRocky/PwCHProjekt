#!/bin/bash

TODAY=$(date +"Data uruchomienia: %A, %d of %B, %r")
FORCLIENT=$(date +"%A, %d of %B, %r")
IMIE=$"Imie: Krzysztof Ogonek"
# Funkcje dla basha które pozwolą m.in. na odczyt daty

> jakiscos.log
# Plik logu do którego umieszczam wpis o którym mowa w punkcie a) zadania 1

> index.html
# Plik html serwera o którym mowa w punkcie b) zadania 1

chmod 777 jakiscos.log
chmod 777 index.html
# Nadaję pełne uprawnienia wszystkim (nie jest to bezpieczne gdybym faktycznie wypuszczał ten kontener na internet, ale w tym przypadku mogę)

echo $TODAY >> jakiscos.log
# Generuję datę i wpisuję ją do pliku .log

echo $IMIE >> jakiscos.log
# Wpisuję swoje imię i nazwisko i wpisuję do pliku .log

netstat -tulpn | grep LISTEN >> jakiscos.log
# Wpisuję otwarte porty na których nasłuchuje kontener i umieszczam je w pliku .log
# Innym sposobem na wypisanie portów byłoby wpisanie "docker ps" i sprawdzenie tam na jakich portach nasłuchuje kontener. Być może prostszym sposobem, ale w tym miejscu było
# tyle kombinowania że już nie chciało mi się tego zmieniać na nic prostszego

ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(.\d+){3}' >> index.html
# Bardzo skomplikowane polecenie które wypisuje adres ip na którym jest dostępny kontener. Ip następnie zapisuję w pliku html

echo $FORCLIENT >> index.html
# Wypisuje datę i zapisuję ją w pliku html

# Ogólnie pragnę przeprosić za tego frankensteina - można by powiedzieć że jest to nic innego jak aplikacja webowa z backendem który stoi na pojedyńczym skrypcie bashowym.
# Jako powód wytłumaczę iż jest to tak zrobione ponieważ próbowałem jak najbardziej zminimalizować rozmiar całego obrazu (z tego co pamiętam obecnie wynosi on 373MB
# a prawdopodobnie dałoby się zejść niżej)
