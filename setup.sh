#!/bin/bash


#sudo apt-get update -y
#sudo apt-get upgrade -y

#sudo apt-get install python -y
#sudo apt-get install python-pip -y
#sudo apt-get install python-setuptools -y
#sudo apt-get install python3 -y
#sudo apt-get install python3-pip -y
#sudo apt-get install python3-setuptools -y
#sudo apt-get install nodejs -y
#sudo apt-get install npm -y
#sudo apt-get install git -y
#sudo apt-get install sqlite3 -y


#sudo pip install pick
#sudo pip install psutil
#sudo pip install socketIO_client_nexus

#sudo pip3 install pick
#sudo pip3 install psutil
#sudo pip3 install cherrypy
#sudo pip3 install hug==2.4.1
#sudo pip3 install pymongo
#sudo pip3 install hug_middleware_cors
#sudo pip3 install socketIO_client_nexus

sudo mkdir /etc/agent
sudo mkdir /etc/agent/codes
sudo mkdir /etc/agent/config
sudo chmod -R 777 /etc/agent

wget https://raw.githubusercontent.com/marc-mila/environmentVehicle/main/insert_sqlite.py
wget https://raw.githubusercontent.com/marc-mila/environmentVehicle/main/car.config
wget -O map.db https://github.com/marc-mila/environmentVehicle/blob/main/map.db?raw=true

mv insert_sqlite.py /etc/agent/
mv car.config /etc/agent/config/
mv map.db /etc/agent/

git clone https://github.com/marc-mila/codesVehicles.git
mv /home/pi/codesVehicles/codes_def.tar /etc/agent/codes/
tar -xvf /etc/agent/codes/codes_def.tar -C /etc/agent/codes/

echo "Test"
hug -f /etc/agent/codes/api.py
