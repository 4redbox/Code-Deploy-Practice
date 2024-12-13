#!/bin/bash
ls
pwd
cd /var/www/myapp
# Start the Flask application server
gunicorn -b 0.0.0.0:5000 app:app > /var/www/myapp/logs/gunicorn.log 2>&1 &
