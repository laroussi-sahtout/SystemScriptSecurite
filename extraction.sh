#!/bin/bash

# Chemin du fichier CSV
CSV_FILE="system_usage.csv"

# En-tête du fichier CSV
echo "Time, CPU(%), Memory(%)" > $CSV_FILE

# Boucle pour collecter les données à intervalles réguliers
while true; do
    # Collecter les informations à partir de top
    TOP_INFO=$(top -b -n 1 | awk 'NR==3 || NR==4 {print $1}' | tr '\n' ',')

    # Extraire les valeurs de CPU et de mémoire
    CPU_USAGE=$(echo $TOP_INFO | cut -d ',' -f 1)
    MEM_USAGE=$(echo $TOP_INFO | cut -d ',' -f 2)

    # Heure actuelle
    TIME=$(date +"%Y-%m-%d %H:%M:%S")

    # Enregistrer les données dans le fichier CSV
    echo "$TIME, $CPU_USAGE, $MEM_USAGE" >> $CSV_FILE

    # Attendre 5 secondes avant de collecter de nouvelles données
    sleep 5
done
