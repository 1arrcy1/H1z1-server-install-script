Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y git
choco install -y --force nodejs
choco install mongodb

git clone https://github.com/H1emu/h1z1-server
cd h1z1-server
npm install
 
New-Item ZoneServerArrcy.ps1
Add-Content ZoneServerArrcy.ps1 '$env:DEBUG="ZoneServer"'
Add-Content ZoneServerArrcy.ps1 '$env:CLIENT_SIXTEEN="true"'
Add-Content ZoneServerArrcy.ps1 '$env:WORLD_ID="2"'
Add-Content ZoneServerArrcy.ps1 '$env:LOGINSERVER_IP="127.0.0.1"'
Add-Content ZoneServerArrcy.ps1 '$env:MONGO_URL="mongodb://localhost:27017/"'
Add-Content ZoneServerArrcy.ps1 'node docker/2016/zoneServer.js'
 
New-Item LoginServerArrcy.ps1
Add-Content LoginServerArrcy.ps1 '$env:DEBUG="*"'
Add-Content LoginServerArrcy.ps1 '$env:CLIENT_SIXTEEN="true"'
Add-Content LoginServerArrcy.ps1 '$env:WORLD_ID="2"'
Add-Content LoginServerArrcy.ps1 '$env:LOGINSERVER_IP="127.0.0.1"'
Add-Content LoginServerArrcy.ps1 '$env:MONGO_URL="mongodb://localhost:27017/"'
Add-Content LoginServerArrcy.ps1 'node docker/2015/loginServer.js'
 
 
start powershell {./LoginServerArrcy.ps1; Read-Host}
start powershell {./ZoneServerArrcy.ps1; Read-Host}
