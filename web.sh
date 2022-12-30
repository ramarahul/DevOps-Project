#!/bin/bash

# Install NGINX
apt-get update
apt-get install -y nginx

# Start NGINX
systemctl start nginx