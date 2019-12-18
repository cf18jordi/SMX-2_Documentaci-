#!/bin/bash

#Creem el volum
docker volume create NOM_VOLUM

#Creem el container associant-lo a un directori del volum
docker container run -dit --name NOM_CONTAINER -v NOM_VOLUM:/$DIRECTORI_DE_CONTAINER ubuntu:trusty /bin/sh

#Traspasem el fitxer comprimit al directori asociat al volum
docker container cp $FITXER_A_TRASSPASSAR $NOM_CONTAINER:/$DIRECTORI_TEMPORAL

#Extreiem el contingut del arxiu comprimit al directori associat
docker container exec contcont tar -xzvf /$DIRECTORI_TEMPORAL/$FITXER_A_TRASSPASSAR -C /$DIRECTORI_TEMPORAL

#Creem un container apache i l'asociem al volum
docker run -dit --name $NOM_APACHE_CONTAINER -p 8080:80 -v $NOM_VOLUM:/usr/local/apache2/htdocs/ httpd:2.4

#iniciem el container apache
docker start $NOM_CONTAINER_APACHE

#Comprovem la ip del container apache
docker inspect $NOM_CONTAINER_APACHE
