#!/bin/bash

#verification qu'il y a au moins un argument au lancement du script
if [ $# -eq 0 ]
then
        echo "Il manque les noms d'utilisateurs en argument - fin du script"

        exit 0
fi

#boucle pour lister chaque utilisateur et les créer
for user in $*
do
#verification que lutilisateur n'existe pas dans le systeme
        if cat /etc/passwd | grep $user >> /dev/null
        then
                echo "l'utilisateur $user existe deja"
        else
                sudo useradd $user


#verification que l'utilisateur a bien été creer
                if cat /etc/passwd | grep $user >> /dev/null
        	then
                	echo "l'utilisateur $user a été créé"
        	else
                	echo "erreur a la creation de l'utilisateur $user"
        	fi
        fi
done
