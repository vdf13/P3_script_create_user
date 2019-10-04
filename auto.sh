#!/bin/bash
# Créé et mis à jour par Victor DE FARIA. Octobre 2019

# script de connexion automatique et de création ou suppression de compte utilisateur pour la formation  Linux
# usage : bash auto.sh create | supprime


connect()
{
for i in `seq 1 10`;
do
	ping -c 1 192.168.100.$i  > /dev/null
	if [ $? -ne 0 ]
	then
		continue
	fi
	echo "La machine en 192.168.100.$i est connectée"
	ssh administrateur@192.168.100.$i bash < /home/administrateur/$1.sh
done

for i in `seq 1 10`;
do 
	ping -c 1 192.168.101.$i > /dev/null
	if [ $? -ne 0 ]
	then
		continue
	fi
	echo "La machine en 192.168.101.$i est connectée"
	ssh administrateur@192.168.101.$i bash < /home/administrateur/$1.sh
done
}

if [ $# = 0 ]
then
	echo " Entrer un argument au script $0 soit create ou supprime "
elif [ "$1" = "create" ] || [ "$1" = "supprime" ]
then
	connect $1
else
	echo "Argument donné invalide, taper bash $0 create ou bash $0 supprime"
fi
