#!/bin/bash

# +---------------------------------------------------------------------------+
# |  Fichier     : Installe_les_services_automator.command                    |
# |  Version     : 1.0.0                                                      |
# |  Auteur      : Bruno Boissonnet                                           |
# |  Date        : 23/10/2016                                                 |
# |  Description : Installe les processus du dépôt en tant que services.      |
# +---------------------------------------------------------------------------+


DOSSIER_SERVICES=/Users/$USER/Library/Services/
#DOSSIER_SERVICES=/Users/$USER/Desktop/essais

# On se met dans le répertoire du script
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd $dir


# Récupère la liste des processus dans le dépôt Automator
mesProcessus=$(find . -type d -name '*.workflow' -print)
# echo $mesProcessus


# Fait un clone de chaque dépôt dans le dossier en cours
for i in $mesProcessus; do
	echo $i
	cd $(dirname $i)
	cp -R $(basename $i) $DOSSIER_SERVICES/$(basename $i)
	cd -
done

exit

