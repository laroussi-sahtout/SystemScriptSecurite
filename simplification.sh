#!/bin/bash

# Fonction pour afficher un message d'étape
step() {
    echo "=============================="
    echo "= $1"
    echo "=============================="
}

# Mise à jour des paquets
step "Mise à jour des paquets"
sudo apt update && sudo apt upgrade -y

# Installation du serveur Web (Apache ou Nginx)
step "Installation du serveur Web"
read -p "Choisissez le serveur Web à installer (Apache/Apache2, Nginx): " web_server
sudo apt install $web_server -y

# Installation de phpMyAdmin
step "Installation de phpMyAdmin"
sudo apt install phpmyadmin php-mbstring php-gettext -y
sudo phpenmod mbstring
sudo systemctl restart $web_server

# Installation du système de gestion de base de données relationnelle (MySQL ou MariaDB)
step "Installation du système de gestion de base de données relationnelle"
read -p "Choisissez le système de gestion de base de données (MySQL/MariaDB): " db_server
sudo apt install $db_server-server -y

# Installation de Node.js et npm
step "Installation de Node.js et npm"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Installation de Git
step "Installation de Git"
sudo apt install git -y

# Affichage des versions installées
step "Versions installées"
$web_server -v
php -v
$db_server --version
node -v
npm -v
git --version

echo "Installation terminée avec succès."
