#!/bin/bash

# Répertoire à sauvegarder
SOURCE_DIR="/home/La_Plateforme/Documents"

# Répertoire de sauvegarde
BACKUP_DIR="/home/La_Plateforme/Documents/Backup"

# Nom du fichier de sauvegarde avec horodatage
BACKUP_FILE="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Chemin complet du fichier de sauvegarde
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Création de l'archive de sauvegarde
tar -czf "$BACKUP_PATH" "$SOURCE_DIR"

# Copie de l'archive dans le répertoire d'historique
cp "$BACKUP_PATH" "$HISTORY_DIR"

# Affichage du message de sauvegarde
echo "Sauvegarde effectuée avec succès : $BACKUP_PATH"

# Suppression des sauvegardes plus anciennes que 7 jours dans l'historique
find "$HISTORY_DIR" -type f -mtime +7 -exec rm {} \;
