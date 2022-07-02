Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
powershell
choco install -y git
choco install -y nvm
choco install mongodb --pre 
powershell
 
nvm install 16.13.1
powershell
nvm use 16.13.1
 
git clone https://github.com/H1emu/h1z1-server
cd h1z1-server
npm install

NewItem ZoneServerArrcy.ps1
Set-Content ZoneServerArrcy.ps1 '$env:DEBUG="ZoneServer"'
Set-Content ZoneServerArrcy.ps1 '$env:CLIENT_SIXTEEN="true"'
Set-Content ZoneServerArrcy.ps1 'echo LOGINSERVER if you want to use h1emu community list'
Set-Content ZoneServerArrcy.ps1 '$env:WORLD_ID="2"'
Set-Content ZoneServerArrcy.ps1 '$env:LOGINSERVER_IP="127.0.0.1"'
Set-Content ZoneServerArrcy.ps1 '$env:MONGO_URL="mongodb://localhost:27017/"'
Set-Content ZoneServerArrcy.ps1 '$env:node out/servers/LoginServer/zoneserver.js'
 
New-Item LoginServerArrcy.ps1
Set-Content LoginServerArrcy.ps1 '$env:DEBUG="*"'
Set-Content LoginServerArrcy.ps1 '$env:CLIENT_SIXTEEN="true"'
Set-Content LoginServerArrcy.ps1 'echo LOGINSERVER if you want to use h1emu community list'
Set-Content LoginServerArrcy.ps1 '$env:WORLD_ID="2"'
Set-Content LoginServerArrcy.ps1 '$env:LOGINSERVER_IP="127.0.0.1"'
Set-Content LoginServerArrcy.ps1 '$env:MONGO_URL="mongodb://localhost:27017/"'
Set-Content LoginServerArrcy.ps1 '$env:node out/servers/LoginServer/loginserver.js'
 
 
start powershell {./LoginServerArrcy.ps1; Read-Host}
start powershell {./ZoneServerArrcy.ps1; Read-Host}