#!/usr/bin/env bash

echo "RUNNING SETUP SCRIPT"

# Clone the tutorial environment repository if it doesn't already exist
if [ ! -d "tutorial-environment" ]; then
    git clone https://github.com/grafana/loki-tutorial-enviroment.git || { echo "Failed to clone repository"; exit 1; }
fi

# Enter the directory and switch to the required branch
cd loki-tutorial-enviroment && git checkout structure-of-logs || { echo "Failed to checkout branch"; exit 1; }

echo "Building training instance...."
docker-compose up -d || { echo "Failed to start docker containers"; exit 1; }

# Update and install required packages
echo "Updating and installing required packages..."
sudo apt-get update && sudo apt-get install -y figlet; clear; echo -e "\e[32m$(figlet -f standard 'Structure of')\e[0m"; echo -e "\e[33m$(figlet -f standard 'Logs')\e[0m"