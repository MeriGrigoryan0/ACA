#!/bin/bash
apt update
apt install nginx
systemctl status nginx
IP=$(curl -s http://icanhazip.com)
echo "Your URL is http://$IP"
