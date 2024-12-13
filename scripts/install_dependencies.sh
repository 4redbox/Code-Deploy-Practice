#!/bin/bash

cd /var/www/myapp

# Install Python dependencies
sudo apt-get update
sudo apt-get install -y python3 python3-pip
pip3 install -r requirements.txt
