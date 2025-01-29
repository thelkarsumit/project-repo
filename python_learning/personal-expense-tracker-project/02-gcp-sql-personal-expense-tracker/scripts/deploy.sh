#!/bin/bash

# Update packages
sudo apt-get update

# Install dependencies
sudo apt-get install python3-pip python3-dev libpq-dev

# Install required Python packages
pip3 install -r requirements.txt

# Run the app using Gunicorn
gunicorn -w 4 app:app
