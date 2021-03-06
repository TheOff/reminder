#!/bin/bash

echo "Starting provision..."


# Locale
locale-gen en_US.UTF-8;
sudo dpkg-reconfigure locales;

export LANGUAGE=en_US.UTF-8;
export LANG=en_US.UTF-8;
export LC_ALL=en_US.UTF-8;


# Git
sudo apt-get install git -y;


# Update Python
sudo add-apt-repository ppa:fkrull/deadsnakes -y;
sudo apt-get update;
sudo apt-get install python3.5 python3-pip python3.5-dev -y;


# Virtual environment
sudo pip3 install virtualenv;
virtualenv /home/vagrant/project/env --python=/usr/bin/python3.5;

# Enable colored console
echo -e "\nforce_color_prompt=yes" >> ~/.bashrc;

# Set source and initial directory
echo -e "\nsource /home/vagrant/.bashrc" >> ~/.profile;
echo "source /home/vagrant/project/env/bin/activate" >> ~/.profile;
echo "cd ~/project/server" >> ~/.profile;


# Requirements
/home/vagrant/project/env/bin/pip install -r /home/vagrant/project/requirements/django.txt;


# Add redis
sudo add-apt-repository ppa:chris-lea/redis-server -y;


# PostgreSQL + PostGIS
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main" >> /etc/apt/sources.list';
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -;
sudo apt-get update;
sudo apt-get install postgresql postgresql-contrib -y;
sudo apt-get -y install libpq-dev;


# Create database superuser;
sudo su - postgres -c "createuser -s vagrant";
createdb -Eutf-8 -l en_US.UTF-8 -T template0 project;


echo "It's okay!"
