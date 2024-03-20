#!/bin/bash

# Vérifier si le système utilise apt ou yum comme gestionnaire de paquets
if command -v apt &> /dev/null; then
    PACKAGE_MANAGER="apt"
elif command -v yum &> /dev/null; then
    PACKAGE_MANAGER="yum"
else
    echo "Gestionnaire de paquets non pris en charge sur ce système."
    exit 1
fi

# Afficher les mises à jour disponibles
echo "Recherche de mises à jour disponibles..."
if [ "$PACKAGE_MANAGER" = "apt" ]; then
    sudo $PACKAGE_MANAGER update
    sudo $PACKAGE_MANAGER list --upgradable
elif [ "$PACKAGE_MANAGER" = "yum" ]; then
    sudo $PACKAGE_MANAGER check-update
fi

# Demander à l'utilisateur s'il souhaite procéder à la mise à jour
read -p "Voulez-vous procéder à la mise à jour des logiciels ? (oui/non) " choice
case "$choice" in 
  oui|OUI|O|o)
    # Mise à jour des logiciels
    echo "Mise à jour des logiciels en cours..."
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        sudo $PACKAGE_MANAGER upgrade -y
    elif [ "$PACKAGE_MANAGER" = "yum" ]; then
        sudo $PACKAGE_MANAGER update -y
    fi
    echo "Mise à jour terminée."
    ;;
  non|NON|N|n)
    echo "Mise à jour annulée."
    ;;
  *)
    echo "Choix invalide. La mise à jour est annulée."
    ;;
esac
