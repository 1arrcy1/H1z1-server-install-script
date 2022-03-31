#!/bin/bash

if (( $EUID == 1 )); then
    echo "Please run as root"
    exit
else
    echo "working"
apt update && apt upgrade -y
apt install nodejs npm git net-tools software-properties-common nano node-typescript -y
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
add-apt-repository 'deb [arch=amd64] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse' -y

apt install mongodb-org -y
systemctl start mongod
systemctl enable mongod
echo "installing GUI web"

npm i pm2 -g
npm i -g mongo-gui
pm2 start mongo-gui
npm cache clean -f
npm install -g n
n stable

hash -r
git clone https://github.com/H1emu/h1z1-server.git
cd h1z1-server
npm install

export VSCODE_DEBUG="true"
export DEBUG="ZoneServer"
export CLIENT_SIXTEEN="true"
export LOGINSERVER_IP="127.0.0.1"
export MONGO_URL="mongodb://localhost:27017/"
pm2 start out/servers/ZoneServer2016/zoneserver.js --watch
pm2 start out/servers/LoginServer/loginserver.js --watch
pm2 startup

echo "script completed"
echo "script completed"
echo "script completed"
echo "Acces MogoDB with http://ip:4321/"
echo "Acces server with ip:1115"
echo "pm2 kill to stop server"
fi
