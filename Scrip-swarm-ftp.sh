#!/bin/bash

#Reps la informació del container
docker system info

#Inicies el container swarm
docker swarm init

#Sortim del container (el deixem inactiu)
docker swarm leave --force

#Reps la informació del container
docker system info

#Anem al directori del arxiu .env
cd [directori del arxiu .env]

#Modifiquem la ip del arxiu amb la de la nostre màquina
nano .env   o  vi .env

#Crea la xarxa del servidor, i arrenca els serveis del mateix
make runstack

#Obtenim usuari i contrasenya del servidor ftp
docker service logs stack001_ftpserver

#Obtenim l'arxiu index.html del servidor
wget http://[ip_del_server_ftp]

#Accedim al servidor amb l'entorn gràfic i actualitzem l'arxiu.
#introduim la ip del servidor ftp al navegador.
