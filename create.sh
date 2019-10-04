#!/bin/bash

# Script appelé par le script auto.sh qui permet de créer un utilisateur et nommer la machine. Partie du projet3
# Victor DE FARIA - Octobre 2019

create()
{
	salle=`hostname -I | cut -d . -f 3`
	poste=`hostname -I | cut -d . -f 4`

	if [ "$salle" == '100' ]
	then
		salle='Abeille'
	elif [ "$salle" == '101' ]
	then
		salle='Baobab'
	fi
	nom="$salle-$poste"
	sudo /sbin/useradd -m -s /bin/bash stagiaire
	sudo sed -i "1i 127.0.0.1 $nom" /etc/hosts
        sudo sed -i '2d' /etc/hosts
	sudo hostnamectl set-hostname "$nom" 
	echo stagiaire:eleve | sudo /sbin/chpasswd
	echo "L'utilisateur 'stagiaire' est bien créé avec le mot de passe 'eleve' sur la machine $nom "

}
create


