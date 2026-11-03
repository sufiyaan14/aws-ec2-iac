#!/bin/bash

apt update 
apt upgrade -y
apt install nginx -y
hostnamectl set-hostname terraformec2
reboot