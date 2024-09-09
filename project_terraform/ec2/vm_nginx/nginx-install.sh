#!/bin/bash

# Update the package list
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras install nginx1 -y

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Create a simple HTML file for testing
sudo bash -c 'echo "<h1>Welcome to Nginx Server!</h1>" > /usr/share/nginx/html/index.html'

# Restart Nginx to apply any changes
sudo systemctl restart nginx
