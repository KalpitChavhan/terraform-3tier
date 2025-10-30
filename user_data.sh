#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Hey Terraform EC2 — My first Cloud Project</h1>" | sudo tee /var/www/html/index.html
