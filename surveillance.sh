#!/bin/bash

# Chemin du fichier CSV
CSV_FILE="system_usage.csv"

# Collecter les informations à partir de top pour une seule itération avec awk
TOP_INFO=$(top -b -n 1 | awk 'NR>=8 {print $1","$9","$10","$12}')

# Extraire les informations de la chaîne TOP_INFO et les stocker dans des variables
TIME=$(date +"%Y-%m-%d %H:%M:%S")
CPU_USAGE=$(echo $TOP_INFO | cut -d ',' -f 2)
MEMORY_USAGE=$(echo $TOP_INFO | cut -d ',' -f 3)
PR=$(echo $TOP_INFO | cut -d ',' -f 4)

# Écriture des données dans le fichier CSV
echo "Time, CPU Usage, Memory Usage, PR" > $CSV_FILE
echo "$TIME, $CPU_USAGE, $MEMORY_USAGE, $PR" >> $CSV_FILE

# Affichage des informations
echo "Les données ont été écrites dans le fichier CSV : $CSV_FILE"

