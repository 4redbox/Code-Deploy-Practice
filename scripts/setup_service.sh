#!/bin/bash

# Define service file path
SERVICE_FILE=/etc/systemd/system/myapp.service

# Create systemd service file
cat <<EOL > $SERVICE_FILE
[Unit]
Description=Gunicorn instance to serve my Flask app
After=network.target

[Service]
User=www-data
Group=www-data
WorkingDirectory=/var/www/myapp
ExecStart=/usr/bin/gunicorn -b 0.0.0.0:5000 app:app
Restart=always
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=myapp

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd to recognize new service
systemctl daemon-reload

# Enable the service to start on boot
systemctl enable myapp.service
