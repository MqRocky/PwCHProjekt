

# Zadanie 1
Plik skrypt.sh (który jest tutaj głównym kodem który robi wszystko) zawarty jest w repozytorium wraz z komentarzami.

# Zadanie 2: 
Plik Dockerfile jest zawarty w repozytorium wraz z komentarzami

# Zadanie 3:
a) Polecenie do zbudowania obrazu:

- docker build -t pwchproj:v3 .

Komentarz: flaga -t oznacza nazwanie budowanego obrazu. Ułatwia to późniejsze manewrowanie w niezliczonych ilościach wersji obrazu które się tworzy w toku budowania oraz debuggowania obrazu.

b) Polecenie do uruchomienia kontenera:

- docker run -p 80:80 --name test1 pwchproj:v3

Komentarz: flaga -p oznacza ustawienie na które port hosta rzutujemy port w kontenerze. Flaga --name nazywa kontener.

c) Log który pobrałem z serwera: (niestety nie ma informacji o otwartych portach - jest to spowodowane tym że zapewne skrypt wykonał polecenie zanim serwer zdążył otworzyć w ogóle port)

![image](https://user-images.githubusercontent.com/50343528/142779548-86d2498a-93c2-4d4b-a38c-c1e20738117a.png)

d) Patrząc na dockerfile oraz na log z buildu obrazu, obraz ma 9 warstw.

Screenshot okna przeglądarki:

![image](https://user-images.githubusercontent.com/50343528/142779741-f02715a0-4746-48cb-8681-024a26b3c559.png)



