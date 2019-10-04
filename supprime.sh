#!/bin/bash


supprime()
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
	sudo /sbin/userdel -f -r stagiaire
	echo " L'utilisateur stagiaire est bien supprimé de la machine $nom "
}
supprime


