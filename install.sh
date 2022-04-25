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
git clone https://github.com/H1emu/h1emu-server-template
cd h1emu-server-template
npm i h1z1-server@latest
npm run build


export DEBUG="ZoneServer"
export CLIENT_SIXTEEN="true"
#remove LOGINSERVER if you want to use h1emu community list
#export WORLD_ID="change me and remove LOGINSERVER"
export LOGINSERVER_IP="127.0.0.1"
export MONGO_URL="mongodb://localhost:27017/"

pm2 kill
pm2 start out/zoneserver.js --watch
export DEBUG="*"
pm2 start out/loginserver.js --watch
pm2 startup

echo 'export DEBUG="ZoneServer"' >> pm2-start-2016-Arrcy.sh
echo 'export CLIENT_SIXTEEN="true"' >> pm2-start-2016-Arrcy.sh
echo '#remove LOGINSERVER if you want to use h1emu community list' >> pm2-start-2016-Arrcy.sh
echo '#export WORLD_ID="change me and remove LOGINSERVER"' >> pm2-start-2016-Arrcy.sh
echo 'export LOGINSERVER_IP="127.0.0.1"' >> pm2-start-2016-Arrcy.sh
echo 'export MONGO_URL="mongodb://localhost:27017/"' >> pm2-start-2016-Arrcy.sh
echo 'pm2 kill' >> pm2-start-2016-Arrcy.sh
echo 'pm2 start mongo-gui' >> pm2-start-2016-Arrcy.sh
echo 'pm2 start out/zoneserver.js --watch' >> pm2-start-2016-Arrcy.sh
echo 'export DEBUG="*"' >> pm2-start-2016-Arrcy.sh
echo 'pm2 start out/loginserver.js --watch' >> pm2-start-2016-Arrcy.sh
echo 'pm2 startup' >> pm2-start-2016-Arrcy.sh
echo 'echo rebooting in 5 seconds' >> pm2-start-2016-Arrcy.sh
echo 'sleep 5' >> pm2-start-2016-Arrcy.sh
echo 'reboot now' >> pm2-start-2016-Arrcy.sh

chmod +x pm2-start-2016-Arrcy.sh
echo "script completed"
echo "script completed"
echo "script completed"
echo "Acces MogoDB with http://ip:4321/"
echo "Acces server with ip:1115"
echo "pm2 kill to stop server, ./pm2-start-2016-Arrcy.sh to start server"
echo "pm2 logs" to see what is happening
echo "write this info down reboot in 5 seconds"
sleep 5
reboot now

fi
